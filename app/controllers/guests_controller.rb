class GuestsController < ApplicationController
  def index
    @chatroom = Chatroom.find(params[:chatroom_id])
    guests = policy_scope(@chatroom.guests)
  end
  
  def destroy

  end
end

