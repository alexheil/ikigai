class Elements::ElementsController < ApplicationController

  before_action :authenticate_user!, except: :show
  before_action :authenticate_owner, except: :show

  def show
    @element = Element.friendly.find(params[:id])
  end

  def new
    @element = Element.new
  end

  def create
    @element = Element.new(element_params)
    if @element.save
      flash[:notice] = "You just created " + @element.title + "!"
      redirect_to element_path(@element)
    else
      flash.now[:alert] = 'Whoa! Something went wrong!'
      render 'new'
    end
  end

  def edit
    @element = Element.friendly.find(params[:id])
  end

  def update
    @element = Element.friendly.find(params[:id])
    if @element.update_attributes(element_params)
      flash[:notice] = "Good job!"
      redirect_to element_path(@element)
    else
      flash.now[:alert] = 'Bad job!'
      render 'edit'
    end
  end

  def destroy
    @element = Element.friendly.find(params[:id]).destroy
    redirect_to root_url
    flash[:notice] = "Delete successful."
  end

  private

    def authenticate_owner
      @user = User.friendly.find(1)
      unless current_user == @user
        redirect_to root_url
      end
    end

    def element_params
      params.require(:element).permit(:title, :description, :image)
    end


end