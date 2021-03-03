class RemindersController < ApplicationController
  # before_action :set_reminder, only: %i[]
  after_action :authorize_reminder, only: %i[new create]

  def index
    @reminders = policy_scope(current_user.reminders).order(created_at: :desc)
  end

  def new
    @reminder = Reminder.new
  end

  def create
    @reminder = Reminder.new(reminder_params)
    @reminder.medicine_dose = dose_format(params.dig(:reminder, :medicine_dose), params[:search_choice])
    @reminder.user = current_user
    @reminder.medicine = find_medicine
    
    if @reminder.save
      redirect_to reminders_path
    else
      render :new
    end
  end

  private

  def authorize_reminder
    authorize @reminder
  end

  def reminder_params
    params.require(:reminder).permit(:alarm_time, :content, :title, :medicine_dose, :search_choice)
  end

  def set_reminder
    @reminder = Reminder.find(params[:id])
  end

  def dose_format(dose_params, medicine_name)
    if dose_params[:medicine_quantity].to_i > 1 && dose_params[:medicine_quantity].to_i.positive?
      "#{medicine_name} - #{dose_params[:medicine_quantity]} #{dose_params[:medicine_unity]}s"
    else
      "#{medicine_name} - #{dose_params[:medicine_quantity]} #{dose_params[:medicine_unity]}"
    end
  end

  def find_medicine
    Medicine.find_by_name(params[:search_choice])
  end
end
