class ProjectPolicy < ApplicationPolicy
    def index?
        is_user?
    end
    def new?
        is_user?
    end
    def show?
        is_admin? or @record.users.include? @user
    end
    def create?
        is_user?
    end
    def destroy?
        is_admin?
    end
end

