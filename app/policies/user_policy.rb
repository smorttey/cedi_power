class UserPolicy < ApplicationPolicy
    # Only admins can view all users
    def index?
      admin?
    end
  
    # Users can view their own profile; admins can view any profile
    def show?
      admin? || user == record
    end
  
    # Only admins can create or delete users
    def create?
      admin?
    end
  
    def destroy?
      admin?
    end
  
    # Users can update their own profile; admins can update any profile
    def update?
      admin? || user == record
    end
  
    class Scope < Scope
      # Admins can view all users; general users see only themselves
      def resolve
        if admin?
          scope.all
        else
          scope.where(id: user.id)
        end
      end
    end
  end
  