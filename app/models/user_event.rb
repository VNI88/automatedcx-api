class UserEvent < ApplicationRecord
  belongs_to :user

  scope :unconfirmed_accounts, lambda {
    where(category: 'registration')
      .where(user_id: new_users.pluck(:user_id))
      .where.not(name: 'account_confirmation')
  }

  scope :new_users, lambda {
    where( name: 'new_user')
  }
end
