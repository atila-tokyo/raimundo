class GuestsController < ApplicationController
  def index
    @chatroom = Chatroom.find(params[:chatroom_id])
    guests = policy_scope(@chatroom.guests)
  end

  def destroy
    if params[:format].present?
      destroy_one_guest(params)
      redirect_to chatroom_guests_path(params[:format])
    elsif params[:id].present? && !params[:chatroom].present?
      guest_leave_chatroom(params)
      redirect_to chatrooms_path
    elsif params[:chatroom][:users].present?
      destroy_multiple_guests(params)
      redirect_to chatroom_guests_path(params[:id])
    else
      return
    end
  end

  private

  # inside chatroom/id/guests
  def destroy_multiple_guests(params)
    params[:chatroom][:users].each do |user_id|
      user = User.find(user_id)
      guest = Guest.find_by(user: user, chatroom: Chatroom.find(params[:id]))
      authorize guest
      guest.destroy
    end
  end

  # destroy only one guest
  def destroy_one_guest(params)
    user = User.find(params[:id])
    guest = Guest.find_by(user: user, chatroom: Chatroom.find(params[:format]))
    authorize guest
    guest.destroy
  end

  # destroy guest when user chooses to leave the chatroom
  def guest_leave_chatroom(params)
    user = User.find(params[:id])
    guest = Guest.find_by(user: user)
    authorize guest
    guest.destroy
  end
end
