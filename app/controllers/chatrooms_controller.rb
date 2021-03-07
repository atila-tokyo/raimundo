class ChatroomsController < ApplicationController
  before_action :set_chatroom, only: %i[edit update destroy]

  def index
    @chatrooms = policy_scope(Chatroom).order(created_at: :desc)
  end

  def new
    @chatroom = Chatroom.new
    authorize @chatroom
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    authorize @chatroom

    @chatroom.user = current_user

    if @chatroom.save
      redirect_to chatrooms_path
    else
      render :new
    end
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
