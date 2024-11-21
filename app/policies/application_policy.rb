class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  # Role helpers
  def admin?
    user&.admin?
  end

  def general_user?
    user&.general_user?
  end

  def store_owner?
    user&.store_owner?
  end

  # Default permissions
  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def update?
    false
  end

  def destroy?
    false
  end

  # Public access helper
  def public_access?
    user.nil?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.none
    end
  end
end
