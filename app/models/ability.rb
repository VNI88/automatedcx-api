# typed: true
# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user || User.new
      can :access, :rails_admin
      can :read, :dashboard

      if user.role == 'developer'
        can %i[create read update export], Event, user_id: user.id
        can :manage, Routine, user_id: user.id
        can :read, User, company_id: user.company_id
      elsif user.role == 'analyst'
        can %i[read export], [Routine, Event], user: { company_id: user.company_id }
        can %i[read export], User, user: { company_id: user.company_id }
        can :read, Company, id: user.company.id
      elsif user.role == 'admin'
        can :manage, [Routine, Event], user: { company_id: user.company_id }
        can :manage, User, company_id: user.company.id
        can :manage, Company, id: user.company.id
      elsif user.role == 'admin' && user.company&.name == 'AutomatedCX'
        can :manage, :all
      end
    end
  end
end
