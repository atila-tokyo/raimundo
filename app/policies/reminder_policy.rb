class ReminderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all.where(user: user)
    end
  end

  def show?
    is_owner?
  end

  def create?
    true
  end

  def edit?
    is_owner? 
  end

  def update?
    is_owner?
  end
  
  def destroy
    is_owner?
  end
  
  private

  def is_owner?
    user == record.user 
  end


end
