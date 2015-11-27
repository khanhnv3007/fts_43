class Ability
  include CanCan::Ability

  def initialize user
    return if user.nil?
    if user.admin?
      can :manage, :all
    else
      can [:update, :show], User, id: user.id
      can [:index], Subject
      can [:new, :create, :index], Question
      can [:edit, :update], Question, user_id: user.id
    end
  end
end
