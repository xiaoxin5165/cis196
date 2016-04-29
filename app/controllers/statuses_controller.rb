class StatusesController < ApplicationController
  before_action :set_status, only: [:edit, :update, :destroy, :like, :unlike]

  # GET /statuses/new
  def new
    @status = Status.new
  end

  # GET /statuses/1/edit
  def edit
  end

  # POST /statuses
  def create
    @status = Status.new(status_params)
    if @status.save
      current_user.statuses.append(@status)
      redirect_to current_user, notice: 'status was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /statuses/1
  def update
    if @status.update(status_params)
      redirect_to current_user, notice: 'status was successfully updated.'
    else
      render :edit
    end
  end

  def like
    # if a status is liked append to likes
    @status.likes.append(current_user)
    @owner = User.find(params[:page_id])
    redirect_to @owner, notice: 'You liked the comment.'
  end

  def unlike
    # if unlike remove the user from likes
    @status.likes.delete(current_user)
    @owner = User.find(params[:page_id])
    redirect_to @owner, notice: 'You unliked the comment.'
  end

  def followup
    @status = Status.new
  end

  def fodelete
    # delete if from status
    @status = Status.find(params[:id])
    Status.find(params[:delete_id]).destroy
    redirect_to User.find(@status.user_id), notice: 'you have deleted your followup.'
  end

  def follow
    # make a new status
    @status = Status.new(text: params[:status][:text])
    if @status.save
      # then append to parent status
      @parent = Status.find(params[:status][:parent_id])
      @parent.followups.append(@status)
      # append to replies
      current_user.replies.append(@status)
      redirect_to User.find(@parent.user_id), notice: 'You have commented successfully.'
    else
      render :followup
    end
  end

  # DELETE /statuses/1
  def destroy
    @status.destroy
    redirect_to current_user, notice: 'Status was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_status
    @status = Status.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def status_params
    params.require(:status).permit(:text)
  end
end
