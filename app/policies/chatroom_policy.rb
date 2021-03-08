class ChatroomPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope ===> Reminder
      scope.where(user: user)
    end
  end

  def show?
    # owner? || invited?
    true
  end

  def new?
    true
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

  def destroy?
    owner?
  end

  private

  def owner?
    record.user == user
  end

  def invited?
    record.user_recipient = user
  end
end
