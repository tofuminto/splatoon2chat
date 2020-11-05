class ChatsController < ApplicationController

  def index
    @message = Chat.find(1)
  end

  def new
    @message = Chat.new
  end

  def create
    @message = Chat.new(chat_params)
    if @message.save!(chat_params)
      redirect_to root_path
    else
      render "index"
    end
  end

  private
  def chat_params
    params.require(:chat).permit(:content)
  end
end
