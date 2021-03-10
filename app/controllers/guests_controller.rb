class GuestsController < ApplicationController
  def index
    @chatroom = Chatroom.find(params[:chatroom_id])
    guests = policy_scope(@chatroom.guests)
  end

  def destroy
    # guest = Guest.where("user_id = ? AND chatroom_id = ?", params[:id], params[:format]).first
    guest = Guest.find_by(user: User.find(params[:id]), chatroom: Chatroom.find(params[:format]))
    authorize guest
    guest.destroy
    redirect_to chatroom_guests_path(params[:format])
  end
end
