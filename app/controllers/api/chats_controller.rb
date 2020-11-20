class Api::ChatsController < ApplicationController
  def index
    last_message_id = params[:id].to_i
    @messages = Chat.includes(:user).where("id > ?", last_message_id)
  end
end