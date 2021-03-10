class GuestsController < ApplicationController
  def index
    @chatroom = Chatroom.find(params[:chatroom_id])
    guests = policy_scope(@chatroom.guests)
  end

  def destroy
    # guest = Guest.where("user_id = ? AND chatroom_id = ?", params[:id], params[:format]).first
    if params[:format].present?
      user = User.find(params[:id])
      guest = Guest.find_by(user: user, chatroom: Chatroom.find(params[:format]))
      redirect_to chatroom_guests_path(params[:format])
    elsif params[:chatroom][:users].present?
      params[:chatroom][:users].each do |user_id|
        user = User.find(user_id)
        guest = Guest.find_by(user: user, chatroom: Chatroom.find(params[:id]))
        guest.destroy
      end
        redirect_to chatroom_guests_path(params[:id])
      

    else
      user = User.find(params[:id])
      guest = Guest.find_by(user: user)
      redirect_to chatrooms_path
    end
    authorize guest
    guest.destroy
  end
end
