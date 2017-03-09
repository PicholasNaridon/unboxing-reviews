class ItemsController < ApplicationController
  before_action :authorize_user, except: [:index, :show]
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @user = current_user
  end

  def edit
    @item = Item.find(params[:id])
  end

  def show
    @item = Item.find(params[:id])
    @creator = @item.user
    @review = Review.new
    @reviews = @item.reviews
    @reviews_start = 0
  end

  def update
    @item = Item.find(params[:id])

    if @item.update_attributes(item_params)
      flash[:notice] = 'Your item has been updated'
      redirect_to @item
    else
      render 'edit'
    end
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user


    if @item.save
      flash[:notice] = "Item added successfully"
      redirect_to item_path(@item)
    else
      flash[:notice] = @item.errors.full_messages
      render :new
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:notice] = 'Item has been deleted!'
    redirect_to items_path
  end

  private
  def item_params
    params.require(:item).permit(:name, :user)
  end

  def authorize_user
    if !user_signed_in? #|| current_user.admin?
      flash[:notice] = "Please log in to use this feature"
      redirect_to new_user_session_path
    end
  end
end
