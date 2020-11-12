class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @messages = @user.chats
  end
end
