class MessagesController < ApplicationController
  before_action :authenticate_user!
  protect_from_forgery with: :null_session

  def index
    user = User.find_by(id: params[:id])
    redirect_to root_path if user.nil?

    list_room_current = current_user.rooms.pluck(:id)
    list_room_user = user.rooms.pluck(:id)
    room_id = list_room_current & list_room_user

    if room_id.first.nil?
      @room = Room.create(name: SecureRandom.hex(6))
      Participant.create([{ user_id: user.id, room_id: @room.id }, { user_id: current_user.id, room_id: @room.id }])
    else
      @room = Room.find_by(id: room_id.first)
    end

    @users = User.all_except(current_user.id)
    @messages = Message.where(room_id: @room.id)
  end

  def create
    @message = Message.new(param_message)

    # Lưu message và gửi broadcast tới room sử dụng background job
    if @message.save
      SendMessageJob.perform_later(params[:message][:room_id], @message)
      render json: { message: 'create success' }, status: 200
    else
      render json: { error: @message.errors.full_messages.first }
    end
  end

  def param_message
    params.require(:message).permit(:room_id, :user_id, :content)
  end
end
