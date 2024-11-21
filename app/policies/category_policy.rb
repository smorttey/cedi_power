class CategoryPolicy < ApplicationPolicy
    # Everyone can view categories
    def index?
      true
    end
  
    def show?
      true
    end
  
    # Only admins can manage categories
    def create?
      admin?
    end
  
    def update?
      admin?
    end
  
    def destroy?
      admin?
    end
  
    class Scope < Scope
      # Everyone can view all categories
      def resolve
        scope.all
      end
    end
  end
  