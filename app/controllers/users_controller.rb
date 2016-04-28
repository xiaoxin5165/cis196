class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :acceptfriend]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  def unfriend
    @target = User.find(params[:id])
    @target.friends.delete(current_user)
    current_user.friends.delete(@target)
    redirect_to current_user, notice: 'User was successfully created.'
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def acceptfriend
    @targetuser = User[:sender_id]
    @user.friendships.append(@targetuser)
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    session[:user_id] = nil
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
