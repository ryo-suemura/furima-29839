class PurchasesController < ApplicationController
  before_action :setting
  before_action :move_to_index

  def index
    @buyer_purchase = BuyerPurchase.new
  end

  def create
    @buyer_purchase = BuyerPurchase.new(purchase_params)
    if @buyer_purchase.valid?
      pay_item
      @buyer_purchase.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def setting
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:buyer_purchase).permit(:postal_code, :place_id, :city, :address, :building_name, :telephone_number, :purchase_id)
          .merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    redirect_to root_path if user_signed_in? != true || @item.user_id == current_user.id || @item.purchase.present?
  end
end
