class ProjectPolicy < ApplicationPolicy
    def new?
        is_admin?
    end
    def show?
        is_admin? or @record.users.include? @user
    end
    def create?
        is_admin?
    end
    def destroy?
        is_admin?
    end
end

