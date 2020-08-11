class Event < ApplicationRecord
  belongs_to :user
  before_save :previous_event_id

  scope :unconfirmed_accounts, lambda {
    where(category: 'registration')
      .where(user_id: new_users.pluck(:user_id))
      .where.not(name: 'account_confirmation')
  }

  scope :new_users, lambda {
    where( name: 'new_user')
  }

  def previous_event_id
    self.previous_event_id = Event.where(user_id: self.user_id)
                                  .where(name: self.previous_event_name)
                                  .where(category: self.category).last.&id
  end

  scope :based_on_company_name, lambda {
    joins(:user)
      .where('users.company_name = ?', current_user.company_name)
  }
end
