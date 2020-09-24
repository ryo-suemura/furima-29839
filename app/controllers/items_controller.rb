class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :price, :image, :category_id, :condition_id, :delivery_fee_id, :place_id, :days_id, :user_id).merge(user_id: current_user.id)
  end
end
