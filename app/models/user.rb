# typed: false
# frozen_string_literal: true

class User < ApplicationRecord
  include RailsAdminCharts

  before_create :create_api_key, :company_id
  before_save { self.email = email.downcase }
  before_save { self.company_id = Company.last.id if company_id.nil? }

  after_create :new_user_event

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_paper_trail

  has_many :events
  has_many :routines
  has_one :attendant
  belongs_to :company, optional: true

  validates :name, presence: true, length: { maximum: 80 }
  validates :encrypted_password, presence: true, length: { minimum: 8 }
  validates :role, presence: true
  VALID_EMAIL_FORMAT = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i.freeze
  validates :email,
            presence: true,
            length: { maximum: 260 },
            format: { with: VALID_EMAIL_FORMAT },
            uniqueness: { case_sensitive: false }

  def create_api_key
    self.api_key = generate_api_key
  end

  def generate_api_key
    SecureRandom.base58(20)
  end

  def new_user_event
    new_user = User.last
    Event.create(
      user_id: new_user.id,
      category: 'registration',
      name: 'new_user',
      started_at: new_user.created_at,
      finished_at: Time.now
    )
  end

  def self.current
    Thread.current[:user]
  end

  def self.current=(user)
    Thread.current[:user] = user
  end
end
