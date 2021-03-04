class ReminderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope ===> Reminder
      scope.all.where(user: user)
    end
  end

  def show?
    owner?
  end

  def create?
    true
  end

  def edit?
    owner?
  end

  def update?
    owner?
  end

  def destroy
    owner?
  end

  private

  def owner?
    record.user == user
  end
end
