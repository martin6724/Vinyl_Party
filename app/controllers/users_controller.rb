class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new user_params
    return render action: 'new' unless @user.save
    redirect_to album_path, notice: 'created user'
  end

  private
  def user_params
    params.
    require(:user).
    permit(:username,
    :password,
  :password_confirmation)
end
end
