class RemindersController < ApplicationController
  before_action :set_reminder, only: %i[edit update destroy]

  def index
    @reminders = policy_scope(Reminder).order(created_at: :desc)
  end

  def new
    @reminder = Reminder.new
    authorize @reminder
  end

  def create
    @reminder = Reminder.new(reminder_params)

    authorize @reminder
    # If it is a reminder for medicine
    # format dose and find medicine
    unless params[:search_choice].nil?
      @reminder.medicine_dose = dose_format(params.dig(:reminder, :medicine_dose), params[:search_choice])
      @reminder.medicine = find_medicine
    end
    @reminder.alarm_time = date_format(params.dig(:reminder, :alarm_time))
    @reminder.user = current_user

    if @reminder.save
      @reminder.update(reminder_params)
      redirect_to reminders_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @reminder.update(reminder_params)
    # If it is a reminder for medicine
    # format dose and find medicine
    unless params[:search_choice].nil?
      @reminder.medicine_dose = dose_format(params.dig(:reminder, :medicine_dose), params[:search_choice])
      @reminder.medicine = find_medicine
    end
    @reminder.alarm_time = date_format(params.dig(:reminder, :alarm_time))

    redirect_to reminders_path
  end

  def destroy
    @reminder.destroy
    redirect_to reminders_path
  end

  private

  def reminder_params
    params.require(:reminder).permit(:alarm_time, :content, :title, :medicine_dose, :search_choice)
  end

  # find reminder and authorize owner
  def set_reminder
    @reminder = Reminder.find(params[:id])
    authorize @reminder
  end

  # text formmater for dose
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

  # date formatter
  def date_format(date_params)
    # https://apidock.com/ruby/DateTime/strftime
    # Time.parse(date_params, '%d/%m/%Y %I:%M')
    # DateTime.strptime(date_params, "%d/%m/%y %H:%M")
    # %R time, 24-hour (%H:%M)
    Time.strptime(date_params, "%d/%m/%Y %H:%M")
  end
end
