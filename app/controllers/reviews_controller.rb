class ReviewsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @user = current_user
    @review = Review.new(review_params)
    @review.item = @item
    @review.user = @user
    @review.sum_votes = 0
    if @review.save
      ReviewMailer.new_review(@review).deliver_now
      flash[:notice] = "Review successfully saved!!"
      redirect_to item_path(@item)
    else
      flash[:notice] = "Review did not save."
      redirect_to item_path(@item)
    end
  end

  def edit
    @item = Item.find(params[:item_id])
    @review = Review.find(params[:id])
  end

  def update
    @item = Item.find(params[:item_id])
    @review = Review.find(params[:id])

    if @review.update(review_params)
      redirect_to @item, notice: "review was updated"
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:item_id])
    @review = Review.find_by(user: current_user, item: @item)
    @review.destroy
    redirect_to item_path(@item), notice: "Deleted"
  end

  private

  def review_params
    params.require(:review).permit(:body, :rating)
  end

  def authorize_user
    if !user_signed_in?
      flash[:notice] = "Please log in to use this feature"
      redirect_to new_user_session_path
    end
  end
end
