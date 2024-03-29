class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    # things anyone can do
    can [:create, :read], Item
    # only if this user owns the item
    can [:update, :destroy, :see_ad_price, :promote], Item do |item|
      item.yard_sale.user == user
    end
 
    can [:create, :read, :user], YardSale
    # only if this user owns it
    can [:update, :destroy], YardSale do |ys|
      ys.user == user
    end

    # things only managers can do
    if user.is_manager?
      can :manage, User
      can [:edit_ad_prices, :see_ad_price], Item
      can :read, :ad_revenue
    end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
