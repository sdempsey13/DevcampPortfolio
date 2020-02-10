class MessagesController < ApplicationController
  before_action :message_params, only: [:create]

  def index
    @message = Message.all
  end

  def create
    message = Message.new(user_id: current_user.id, body: message_params[:body], chat_room_id: message_params[:chat_room_id])

    if message.save
      flash[:success] = 'Chat room created!'
      redirect_to chat_room_path(message_params[:chat_room_id])
    else
      redirect_to root_path
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :chat_room_id)

  end

end
