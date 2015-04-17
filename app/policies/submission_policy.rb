class SubmissionPolicy < ApplicationPolicy
    def show?
        is_admin? or @record.project.users.include? @user
    end
    def download?
        show?
    end
    def like?
        show?
    end
end

