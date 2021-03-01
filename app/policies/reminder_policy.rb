class ReminderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    #    # - reminder: the reminder passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
    record.user == user
  end
end
