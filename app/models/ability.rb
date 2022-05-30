# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    
#      if user.present?
#       can :manage, Attendance
#       if user.admin?
#        can :manage, :all
#       end
#      end
      user ||= User.new

      # role が admin のユーザーはモデルの操作を行うことができて管理者画面を閲覧可能
      if user.admin?
        can :manage, :all
        can :access_admin_page, :all
  
      # role が superuser のユーザーはモデルの操作を行うことができるが、管理者画面は閲覧不可能
      elsif user.superuser?
        can :manage, :all
        cannot :access_admin_page, :all
  
      # role が general のユーザーはモデルの操作を行うことができず閲覧のみ可能、管理者画面は閲覧不可能
      elsif user.general?
        can :read, :all
        cannot :access_admin_page, :all
  
      # role を持っていないユーザーは全ての画面が閲覧不可能
      else
        cannot :read, :all
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
