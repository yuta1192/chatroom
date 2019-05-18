class ChatsController < ApplicationController
  def index
    @messages = Message.all
    @message = Message.new
  end

  private
    def message_params
      params.require(:message).permit(:username, :content, :user)
    end
end
