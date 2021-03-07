class ChatroomsController < ApplicationController
  def index
    @chatrooms = policy_scope(Chatroom).order(created_at: :desc)
  end

  def new
    @chatroom = Chatroom.new
    authorize @chatroom
  end

  def create
  end

  def show
    @chatrooms = Chatroom.all
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    authorize @chatroom
    authorize @message
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name, :user_recipient)
  end

  def set_chatroom
    @chatroom = Message.find(params[:id])
    authorize @chatroom
  end
end
