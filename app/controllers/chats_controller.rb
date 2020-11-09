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

end
