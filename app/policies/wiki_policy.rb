class WikiPolicy < ApplicationPolicy
    def show?
       user.present?
    end

    def create?
        user.present?
    end
end