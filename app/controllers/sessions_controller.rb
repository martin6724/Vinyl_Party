class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.
    find_by(username: params[:username]).
    try(:authenticate, params[:password])

    # return render action: 'new' unless @user
    if @user
      flash[:success] = "Welcome back #{@user.username}."
      session[:user_id] = @user.id
      redirect_to users_albums_path
    else
      flash[:error] = "Something went wrong. Please try again."
      redirect_to root_path
    end

  end

  def index
    session[:user_id] = @user.id
    redirect_to albums_path
  end
end
