class ChatsController < ApplicationController
  before_action :authenticate_user!

  def index
    @message = Chat.new
    @messages = Chat.includes(:user).last(30)
    @nickname = current_user.nickname if signed_in?
    if request.url == root_url
      redirect_to chats_path
    end
  end

  def create
    @message = Chat.new(chat_params)
    if @message.save!
      respond_to do |format|
        format.html { redirect_to chats_path }
        format.json
      end
    else
      redirect_to chats_path
    end
  end

  private
  def chat_params
    params.require(:chat).permit(:content).merge(user_id: current_user.id)
  end
end
