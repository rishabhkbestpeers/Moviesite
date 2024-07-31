class Ability

  include CanCan::Ability

  def initialize(user)

    if user.admin?
      can :manage, Movie
      can :manage, User
      cannot :manage, Review
    end

    if user.normal?
      can :read, Movie
      can :create, Review
      
    end

  end
end
