class Ability 
    include CanCan::Ability

    def initialize(user)
        if user.nil?
            user ||= User.new # guest user (not logged in)
            
          else
           
            if user.admin?
              can :manage, :all
          
            elsif user.user?
               can :mange, Category
               can :edit, :create, User, user_id: user.id
            #    can :read, :all
            end
        end
    end
end

