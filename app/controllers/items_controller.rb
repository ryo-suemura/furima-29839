class ItemsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :price, :image)
  end
end
