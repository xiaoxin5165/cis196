class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :destroy, :accept]

  # GET /requests/new
  def new
    @request = Request.new
  end

  # POST /users
  def create
    @request = Request.new(request_params)
    if @request.save
      current_user.outgoingrequests.append(@request)
      @request.gettarget.incomingrequests.append(@request)
      @user = @request.from
      redirect_to @user, notice: 'Request was successfully sent.'
    else
      render :new
    end
  end

  def accept
    # when accepted add it friends bothways
    @user.friends.append(@request.from)
    @request.from.friends.append(@user)
    # destroy the request
    @request.destroy
    redirect_to @user, notice: 'You have accepted the friend.'
  end

  # DELETE /users/1
  def destroy
    # destroy the request
    @request.destroy
    redirect_to @user, notice: 'Request was successfully rejected.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_request
    @request = Request.find(params[:id])
    @user = @request.gettarget
  end

  def request_params
    params.require(:request).permit(:sender_id, :recipient_id, :text)
  end
end
