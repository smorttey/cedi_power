class ItemPolicy < ApplicationPolicy
    # Everyone can view items
    def index?
      true
    end
  
    def show?
      true
    end
  
    # Only admins and store owners can create items
    def create?
      admin? || store_owner?
    end
  
    # Only admins and store owners can update items
    def update?
      admin? || store_owner?
    end
  
    # Only admins can delete items
    def destroy?
      admin?
    end
  
    class Scope < Scope
      # Everyone can view all items
      def resolve
        scope.all
      end
    end
  end
  