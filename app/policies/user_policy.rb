class UserPolicy < ApplicationPolicy
    def index?
        is_user?
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
end

