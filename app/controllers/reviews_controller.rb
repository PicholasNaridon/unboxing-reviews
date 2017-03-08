class ReviewsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @user = current_user
    @review = Review.new(review_params)
    @review.item = @item
    @review.user = @user
    if @review.save
      flash[:notice] = "Review successfully saved!!"
        redirect_to item_path(@item)
      else
        flash[:notice] = "Review did not save."
        redirect_to item_path(@item)
    end
  end
  # def edit
  #   @item = Item.find(params[:id])
  #   @review = Review.find(params[:id])
  # end
  def destroy
    @item = Item.find(params[:id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to item_path
  end

private

  def review_params
    params.require(:review).permit(:body)
  end
end
