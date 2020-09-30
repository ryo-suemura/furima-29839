class PurchasesController < ApplicationController

  def index
   @item = Item.find(params[:item_id])
  end

  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.valid?
      @purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:postal_code, :place_id, :city, :address, :building_name, :telephone_number)
  end
end