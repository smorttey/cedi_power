class MarketPolicy < ApplicationPolicy
    # Everyone can view markets
    def index?
      true
    end
  
    def show?
      true
    end
  
    # Only admins can manage markets
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
      # Everyone can view all markets
      def resolve
        scope.all
      end
    end
  end
  