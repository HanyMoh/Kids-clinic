class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.is_admin && user.is_active
       can :manage, :all
    elsif !user.is_admin && user.is_active
      can [:read, :create], Patient
      can [:read, :create], Region
      can [:read, :create], VisitType
      can [:read, :create], Visit
    end
  end
end
