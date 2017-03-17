class Admin::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authorize_admin

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    user = User.find(params[:id])
    review = Review.find_by(user: user)
    item = Item.find_by(user: user)
    review.destroy unless review.nil?
    item.destroy unless item.nil?
    user.destroy
    redirect_to admin_users_path
  end

  def authorize_admin
    if !current_user.try(:admin?)
      flash[:notice] = "You're not an admin"
      redirect_to root_path
    end
  end
end
