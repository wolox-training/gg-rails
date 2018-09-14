class RentPolicy
  attr_reader :user, :rent

  def initialize(user, rent)
    @user = user
    @rent = rent
  end

  def index?
    user == rent.first.user
  end

  def create?
    user == rent.user
  end
end
