class User < ActiveRecord::Base
  has_secure_password
  before_validation :capitalize_name
  validates :email, presence: true,
    uniqueness: true

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password_digest, presence: true
  has_many :favorites
  has_many :visits
  has_many :animal_visits, through: :visits
  has_many :favorite_animals, through: :favorites, source: :animal

  enum role: [:default, :admin]

  def capitalize_name
    first_name = first_name.capitalize if first_name
    last_name = last_name.capitalize if last_name
  end
end
