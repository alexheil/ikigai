class Causes::CausesController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index, :free]
  before_action :authenticate_owner, except: [:show, :index, :free]

  def free
    @element = Element.friendly.find(params[:element_id])
  end

  def index
    @element = Element.friendly.find(params[:element_id])
  end

  def show
    @element = Element.friendly.find(params[:element_id])
    @cause = Cause.friendly.find(params[:id])
    @owner = User.friendly.find(1)
  end

  def new
    @element = Element.friendly.find(params[:element_id])
    @cause = Cause.new
  end

  def create
    @element = Element.friendly.find(params[:element_id])
    @cause = @element.causes.build(cause_params)
    if @cause.save
      flash[:notice] = "You just created " + @cause.title + "!"
      redirect_to element_cause_path(@element, @cause)
    else
      flash.now[:alert] = 'Whoa! Somecause went wrong!'
      render 'new'
    end
  end

  def edit
    @element = Element.friendly.find(params[:element_id])
    @cause = Cause.friendly.find(params[:id])
  end

  def update
    @element = Element.friendly.find(params[:element_id])
    @cause = Cause.friendly.find(params[:id])
    if @cause.update_attributes(cause_params)
      flash[:notice] = "Good job!"
      redirect_to element_cause_path(@element, @cause)
    else
      flash.now[:alert] = 'Bad job!'
      render 'edit'
    end
  end

  def destroy
    @element = Element.friendly.find(params[:element_id])
    @cause = Cause.friendly.find(params[:id]).destroy
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

    def cause_params
      params.require(:cause).permit(:element_id, :title, :image_large_top, :image_description, :image_important, :image_disaster, :image_large_bottom, :image_plan, :image_product, :mini_description, :description, :important, :disaster, :plan, :raised)
    end

end