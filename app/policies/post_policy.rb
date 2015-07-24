class PostPolicy < ApplicationPolicy
  def index?
    true
  end

  class Scope
    attr_reader :user, :scope
    def initialize(user,scope)
      @user = user
      @scope = scope
    end

    def resolve
      unless user.present?
        scope.none
      else
        if user.admin?
          scope.all
        else
          scope.all.where(user_id: user.id)
        end
      end
    end
  end
end