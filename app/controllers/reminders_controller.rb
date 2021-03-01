class RemindersController < ApplicationController
  def index
    @reminders = policy_scope(current_user.reminders).order(created_at: :desc)
  end

  private

  def authorize_reminder
    authorize @reminder
  end

  def reminder_params
    params.require(:reminder).permit(:alarm_time, :content, :title, :medicine_dose)
  end
end
