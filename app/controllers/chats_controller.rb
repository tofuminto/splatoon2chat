class ChatsController < ApplicationController

  def index
    @message = Chat.new
    @messages = Chat.includes(:user).last(6)
    @nickname = current_user.nickname
  end

  def create
    @message = Chat.new(chat_params)
    if @message.save!
      redirect_to root_path
    else
    end
  end

  private
  def chat_params
    params.require(:chat).permit(:content).merge(user_id: current_user.id)
  end
end
