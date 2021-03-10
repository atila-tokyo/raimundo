class GuestsController < ApplicationController
  def index
    @chatroom = Chatroom.find(params[:chatroom_id])
    guests = policy_scope(@chatroom.guests)
  end

  def destroy
    # guest = Guest.where("user_id = ? AND chatroom_id = ?", params[:id], params[:format]).first
    user = User.find(params[:id])
    if params[:format].present?
      guest = Guest.find_by(user: user, chatroom: Chatroom.find(params[:format]))
      redirect_to chatroom_guests_path(params[:format])
    else
      guest = Guest.find_by(user: user)
      redirect_to chatrooms_path
    end
    authorize guest
    guest.destroy
  end
end
