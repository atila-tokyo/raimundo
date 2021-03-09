class GuestPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def destroy?
    true
  end

  private

  def owner?
    record.user == user
  end
end
