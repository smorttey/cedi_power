class PricePolicy < ApplicationPolicy
    # Everyone can view prices
    def index?
      true
    end

    def show?
      true
    end

    # Only store owners and admins can create or update prices
    def create?
      admin? || store_owner?
    end

    def update?
      admin? || store_owner?
    end

    # Only admins can delete prices
    def destroy?
      admin?
    end

    class Scope < Scope
      # Everyone can view all prices
      def resolve
        scope.all
      end
    end
end
