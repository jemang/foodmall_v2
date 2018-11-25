class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    @product.save
    respond_with_save(@product)
  end

  def update
    @product.update(product_params)
    respond_with_save(@product)
  end

  def destroy
    @product.destroy
    respond_with_save(@product)
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:item_name, :price, :description, :status, :image)
    end
end
