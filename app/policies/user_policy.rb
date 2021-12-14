class UserPolicy < ApplicationPolicy

    def update?
     user_is_admin
    end

    def edit?
     user_is_admin
    end

    private

    def user_is_admin
      user.has_role? :admin
    end
end
