class UserPolicy < ApplicationPolicy
    def index?
        is_admin?
    end
    def edit?
        is_admin?
    end
    def create?
        is_admin?
    end
    def update?
        is_admin?
    end
    def destroy?
        is_admin?
    end
    def projects?
        @user == @record or is_admin?
    end
end

