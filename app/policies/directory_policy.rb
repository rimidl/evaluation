class DirectoryPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @directory = model
  end

  def index?

  end

  def show?
    check_user || @directory.directory_permissions.where(user: @current_user).any?
  end

  def edit?
    check_user
  end

  def update?
    check_user
  end

  def destroy?
    check_user
  end

  private

  def check_user
    @current_user.admin? || @directory.user == @current_user
  end

end
