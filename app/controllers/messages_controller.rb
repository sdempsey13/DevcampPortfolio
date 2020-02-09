class MessagesController < ApplicationController

  def index
    @message = Message.all
  end

  def create
    @chat_room = ChatRoom.first
    @message = current_user.messages.build(message_params)
    @message.chat_room_id = @chat_room.id

    if @message.save
      flash[:success] = 'Chat room created!'
      redirect_to chat_rooms_path
    else
      redirect_to root_path
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

end
