class RemindersController < ApplicationController
  before_action :set_reminder, only: %i[create]
  after_action :authorize_reminder, only: %i[new create]

  def index
    @reminders = policy_scope(current_user.reminders).order(created_at: :desc)
  end

  def new
    @reminder = Reminder.new
  end

  def create
  end

  private

  def authorize_reminder
    authorize @reminder
  end

  def reminder_params
    params.require(:reminder).permit(:alarm_time, :content, :title, :medicine_dose)
  end

  def set_reminder
    @reminder = Reminder.find(params[:id])
  end
end
