class MessagePolicy < ApplicationPolicy
  def create?
    true
  end

  def show?
    true
  end

  def index?
    owner?
  end

  private

  def owner?
    record.user == user
  end
end
