class ProductsController < ApplicationController
    def index
      @products = Product.all
    end
  
    def show
      @product = Product.find(params[:id])
    end
  
    def new
      @product = Product.new
    end
  
    def create
      @product = Product.new(product_params)
  
      if @product.save
        redirect_to products_path
      else
        render 'new'
      end
    end
    
    def edit
        @product = Product.find(params[:id])
      end
    
      def update
        @product = Product.find(params[:id])
    
        if @product.update(product_params)
          redirect_to products_path
        else
          render 'edit'
        end
      end
    
      def destroy
        @product = Product.find(params[:id])
        @product.destroy
    
        redirect_to products_path
      end
    
      def search
        @products = Product.where("name ILIKE ?", "%#{params[:q]}%")
      end
    
      private
    
      def product_params
        params.require(:product).permit(:name, :image, :price, :available, :description, :category, :brand, :gtin)
      end
  

  end
  