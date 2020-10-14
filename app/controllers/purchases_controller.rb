class PurchasesController < ApplicationController

  def index
    @purchases = Purchase.all
    render :index
  end

  def new
    @purchase = Purchase.new
    render :new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.save
      redirect_to purchases_path
    else
      render :new
    end
  end

  def show
    @purchase = Purchase.find(params[:id])
    @products = Product.all
    render :show
  end

  def edit
    @products = Product.all
    @purchase = Purchase.find(params[:id])
    render :edit
  end

  def update
    @purchase = Purchase.find(params[:id])
    if purchase_params["chk"]
        param = {"total" => purchase_params["chk"].map(&:to_i).inject(0){|sum,x| sum + x }}
        puts param
        if @purchase.update(param)
          redirect_to purchase_path
        end
    elsif @purchase.update(purchase_params)
        puts purchase_params
        # selected = params[:chk].inject(0){|sum,x| sum + x }
        puts 'selected'
        redirect_to purchases_path
    else 
        render :edit
    end
  end
  

  def destroy
    @purchase = Purchase.find(params[:id])
    @purchase.destroy
    redirect_to purchases_path
  end

  def add_prices
    total = 0
    selected = params[:chk].inject(0){|sum,x| sum + x }
    @purchase = Purchase.find(params[:id])
    # products = Product.all
    # products.each do |product|
    #   if product.purchase_id == @purchase.id
    #     total += product.price
    #   end
    # end
    puts selected
    @purchase.total = selected
    self.update
  end

  private
  def purchase_params
    params.require(:purchase).permit(:name, :total, chk: [])
  end
  
end