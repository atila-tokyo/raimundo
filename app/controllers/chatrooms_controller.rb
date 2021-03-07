class ChatroomsController < ApplicationController
  def index
    @chatrooms = policy_scope(Chatroom).order(created_at: :desc)
  end

  def show
    @chatrooms = Chatroom.all
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    authorize @chatroom
    authorize @message
  end
end
