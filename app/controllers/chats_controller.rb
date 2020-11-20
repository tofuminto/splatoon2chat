class ChatsController < ApplicationController

  def index
    @message = Chat.new
    @messages = Chat.includes(:user).last(30)
    @nickname = current_user.nickname if signed_in?
  end

  def create
    @message = Chat.create(chat_params)
    if @message.save!
      respond_to do |format|
        format.html { redirect_to :root }
        format.json
      end
    else
      render :new
    end
  end

  private
  def chat_params
    params.require(:chat).permit(:content).merge(user_id: current_user.id)
  end
end
