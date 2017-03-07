class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      flash[:notice] = "Item added successfully"
      redirect_to item_path(@item)
    else
      flash[:notice] = @item.errors.full_messages
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name)
  end
end
