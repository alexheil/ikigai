class Products::ProductsController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index, :free]
  before_action :authenticate_owner, except: [:show, :index, :free]

  def free
    @element = Element.friendly.find(params[:element_id])
    @cause = Cause.friendly.find(params[:cause_id])
  end

  def index
    @element = Element.friendly.find(params[:element_id])
    @cause = Cause.friendly.find(params[:cause_id])
  end

  def show
    @element = Element.friendly.find(params[:element_id])
    @cause = Cause.friendly.find(params[:cause_id])
    @product = Product.friendly.find(params[:id])
    @owner = User.friendly.find(1)
  end

  def new
    @element = Element.friendly.find(params[:element_id])
    @cause = Cause.friendly.find(params[:cause_id])
    @product = Product.new
  end

  def create
    @element = Element.friendly.find(params[:element_id])
    @cause = Cause.friendly.find(params[:cause_id])
    @product = @cause.products.build(product_params)
    if @product.save
      flash[:notice] = "You just created " + @product.title + "!"
      redirect_to element_cause_product_path(@element, @cause, @product)
    else
      flash.now[:alert] = 'Whoa! Someproduct went wrong!'
      render 'new'
    end
  end

  def edit
    @element = Element.friendly.find(params[:element_id])
    @cause = Cause.friendly.find(params[:cause_id])
    @product = Product.friendly.find(params[:id])
  end

  def update
    @element = Element.friendly.find(params[:element_id])
    @cause = Cause.friendly.find(params[:cause_id])
    @product = Product.friendly.find(params[:id])
    if @product.update_attributes(product_params)
      flash[:notice] = "Good job!"
      redirect_to element_cause_product_path(@element, @cause, @product)
    else
      flash.now[:alert] = 'Bad job!'
      render 'edit'
    end
  end

  def destroy
    @element = Element.friendly.find(params[:element_id])
    @cause = Cause.friendly.find(params[:cause_id])
    @product = Product.friendly.find(params[:id]).destroy
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

    def product_params
      params.require(:product).permit(:cause_id, :title, :description, :mini_description, :element, :base_price, :shipping_price, :total_price, :quantity, :element, :element_image, :cause, :cause_large_image, :cause_small_image, :amount_to_product, :product_plus1, :product_plus2, :product_plus3, :product_other, :amount_to_cause, :cause_plus1, :cause_plus2, :cause_plus3, :cause_other, :amount_to_company, :company_plus1, :company_plus2, :company_plus3, :company_other, :size, :color, :image1, :image2, :image3, :image4, :on_sale)
    end

end