class SessionsController < ApplicationController
  def create
    @user = User.find_by(name: params[:name])
    if !@user.nil? && @user.password == params[:password]
      session[:user_id] = @user.id
      redirect_to @user
    end
    redirect_to login_path unless !@user.nil? && @user.password == params[:password]
  end

  def new
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
