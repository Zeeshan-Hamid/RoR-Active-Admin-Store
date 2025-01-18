class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = current_user.products.build(product_params) 
    if @product.save
      redirect_to @product, notice: "Product was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end
  

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @product.destroy
      redirect_to products_path, notice: "Product was successfully deleted."
    else
      redirect_to products_path, alert: "Failed to delete the product."
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :img, :description)
  end
  def set_product
    @product = Product.find(params[:id])
  end
end
