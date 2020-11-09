class ChatsController < ApplicationController

  def index
    @message = Chat.new
    @messages = Chat.last(6)
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
    params.require(:chat).permit(:content)
  end
end
