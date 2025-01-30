class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  # def user_params
  #   params.require(:user).permit(:photo)
  # end

  def user_params
    params.require(:user).permit(:username, :description, :photo)
  end

end
