class ChatroomPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope ===> Reminder
      scope.where(user: user)
      # scope.all.select do |chatroom|
      #   chatroom.guests.select { |user| user.id == current_user.id }
      # end
    end
  end

  def show?
    owner? || invited?
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
    user.part_of.include?(record)
  end
end
