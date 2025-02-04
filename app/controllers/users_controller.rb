class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @toys= @user.toys
    @review = Review.new
  end
end
