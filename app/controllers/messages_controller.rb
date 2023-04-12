class MessagesController < ApplicationController
  before_action :authenticate_user!
  protect_from_forgery with: :null_session

  def index
    # redirect_to root_path unless User.find_by(id: params[:user_id]).present?
    @messages = Message.where(room_id: params[:room_id])
    @room = Room.find_by(id: params[:room_id])
  end

  def create
    @message = Message.create(param_message)
    respond_to do |format|
      html_string = render_to_string(partial: 'messages/detail', locals: { message: @message })
      format.json { render json: { status: 200, data: { message: html_string } } }
    end
  end

  def param_message
    params.require(:message).permit(:room_id, :user_id, :content)
  end
end
