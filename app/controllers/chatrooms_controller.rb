class ChatroomsController < ApplicationController
  before_action :set_chatroom, only: %i[show edit update destroy]
  before_action :authorized_users, only: %i[index show]

  def index
  end

  def new
    @chatroom = Chatroom.new
    authorize @chatroom
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)

    @chatroom.user = current_user

    authorize @chatroom

    if @chatroom.save
      if params[:chatroom][:users].present?
        users = User.find(params[:chatroom][:users])

        users.each do |user|
          Guest.create(
            user: user,
            chatroom: @chatroom
          )
        end
      end

      redirect_to chatrooms_path
      flash[:notice] = "Conversa #{@chatroom.name} criada com sucesso!"
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
    @message = Message.new
    @messages = @chatroom.messages
    authorize @message
  end

  def destroy
    @chatroom.destroy
    redirect_to chatrooms_path
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name)
  end

  def set_chatroom
    @chatroom = Chatroom.find(params[:id])
    authorize @chatroom
  end

  def authorized_users
    @result = []
    chatrooms = policy_scope(Chatroom).order(created_at: :desc)
    member = current_user.part_of
    @result << chatrooms
    @result << member
    @result.flatten!.uniq!
  end
end
