class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_filter :set_search



  # GET /products
  # GET /products.json
def index
  category_id = params[:category]
  unless category_id.present?
  @products = @search.result.page(params[:page]).per_page(15)
  @search.build_sort if @search.sorts.empty?
  else
    @products = Product.where(:category_id => category_id).page(params[:page]).per_page(15)
  end


end

def lihat
   category_id = params[:category]
  unless category_id.present?
    @products = Product.all
    @products = Product.search(params[:search]).order("created_at DESC").page(params[:page]).per_page(9)
  else
    @products = Product.where(:category_id => category_id)
  end
end

  # GET /products/1
  # GET /products/1.json
  def show
    @reviews = Review.where(product_id: @product.id).order("created_at DESC")
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_search
        @search = Product.search(params[:q])      
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :price, :description, :category_id)
    end
end
