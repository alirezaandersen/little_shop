class Visit < ActiveRecord::Base
  attr_reader :contents

  belongs_to :user
  has_many :animal_visits
  has_many :animals, through: :animal_visits

  validates :animal_id, presence: true
  validates :user_id, presence: true
  # validates :date, presence: true
  # validates :time, presence: true


end
