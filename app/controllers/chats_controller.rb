class ChatsController < ApplicationController
  def index
    @messages = Message.all
    @u_message = Message.find_by(id: current_user)

    not_current_user = User.where.not(id: current_user.id)
    @other_message = Message.find_by(id: not_current_user)
  end
end
