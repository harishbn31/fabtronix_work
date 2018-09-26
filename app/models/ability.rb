class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil?
        can :read, [Category]
    else
        if user.role? nil
            can :read, [Category]
        elsif user.role? "admin"
            #can [:create, :read, :update, :destroy]
            can :manage, [Category, User, Role, Permission]
        elsif user.role? "user"
            if user.role? "editor"
                can :edit, [Category]
            end
            if user.role? "create"
                can :create, [Category]
            end
            if user.role? "show"
                can :show, [Category]
            end
            if user.role? "delete"
                can :destroy, [Category]
            end
            
        can :read, [Category]
        # elsif user.role? "editor"
        #     can :edit, [Category]
        # elsif user.role? "create"
        #     can :create, [Category]
        # elsif user.role? "show"
        #     can :show, [Category]
        # elsif user.role? "delete"
        #     can :destroy, [Category]
        end
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
