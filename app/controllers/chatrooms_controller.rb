class ChatroomsController < ApplicationController
  before_action :set_chatroom, only: %i[show edit update destroy]

  def index
    @chatrooms = policy_scope(Chatroom).order(created_at: :desc)
  end

  def new
    @chatroom = Chatroom.new
    authorize @chatroom
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)

    @chatroom.user = current_user
    # @chatroom.user_recipient = authorized_users

    authorize @chatroom

    if @chatroom.save
      flash[:success] = "Conversa #{@chatroom.name} foi criada com sucesso"
      redirect_to chatrooms_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @chatroom.update(chatroom_params)

    redirect_to chatrooms_path
  end

  def show
    @chatrooms = policy_scope(Chatroom).order(created_at: :desc)
    @message = Message.new

    authorize @message
  end

  def destroy
    @chatroom.destroy
    redirect_to chatrooms_path
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name, :user_recipient)
  end

  def set_chatroom
    @chatroom = Chatroom.find(params[:id])
    authorize @chatroom
  end

  def autorized_users
    User.find_by_name(params[:user_recipient])
  end
end
