# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user || User.new
      can :access, :rails_admin
      can :read, :dashboard

      if user.role == 'developer'
        can [:create, :read, :update, :export], Event, user_id: user.id
        can :manage, Routine, user_id: user.id
        can :read, User, company_name: user.company_name
      elsif user.role == 'analyst'
        can [:read, :export], [Routine, Event], user: { company_name: user.company_name }
        can [:read, :export], User, company_name: user.company_name
      elsif user.role == 'admin'
        can :manage, [ Routine, Event], user: { company_name: user.company_name }
        can :manage, User, company_name: user.company_name
      elsif user.role == 'admin' && user.company_name == 'AutomatedCX'
        can :manage, :all
      end
    end
  end
end
