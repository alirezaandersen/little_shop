class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true,
    uniqueness: true

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password_digest, presence: true
  validates :role, presence: true
  has_many :favorites
  has_many :visits
  has_many :visit_animals, through: :visits, source: :animal
  has_many :favorite_animals, through: :favorites, source: :animal

  enum role: [:default, :admin]
end
