class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :user_events
  has_one :attendant

  validates :name, presence: true, length: {maximum: 50}
  validates :encrypted_password, presence: true, length: {minimum: 8}
  VALID_EMAIL_FORMAT= /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :email, presence: true, length: {maximum: 260}, format: { with: VALID_EMAIL_FORMAT}, uniqueness: {case_sensitive: false}

  before_create :set_api_key
  before_save { self.email = email.downcase }

  after_create :new_user_event
  def set_api_key
    self.api_key = generate_api_key
  end

  def generate_api_key
    SecureRandom.base58(20)
  end

  def new_user_event
    new_user = User.last
    UserEvent.create(
      user_id: new_user.id,
      category: 'registration',
      name: 'new_user',
      started_at: new_user.created_at,
      finished_at: Time.now
    )
  end
end
