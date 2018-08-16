class Ability
  include CanCan::Ability
  ABILITY_TYPE = {
    'is_admin' => 'مدير النظام',
    'guest' => 'مدخل بيانات'
  }.freeze


  def initialize(user)
    user ||= User.new # guest user

    if user.is_admin && user.is_active
      can :manage, :all
    elsif !user.is_admin && user.is_active
      can :read,   :patient
      can :create, :patient
      can :update, :patient

      can :read,   :visit
      can :create, :visit
      # can :update, :visit

      can :read,   :visit_type
      can :create, :visit_type
      can :update, :visit_type

      can :read,   :region
      can :create, :region
      can :update, :region
    end
  end
end
