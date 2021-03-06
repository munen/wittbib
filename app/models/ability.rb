class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      can :manage, :all
    else
      can :read, Book
      can :search, Book
    end

  end
end
