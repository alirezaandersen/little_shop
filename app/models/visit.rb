class Visit < ActiveRecord::Base
  attr_reader :contents

  belongs_to :user
  belongs_to :animal

  validates :animal_id, presence: true
  validates :user_id, presence: true
  # validates :date, presence: true
  # validates :time, presence: true



end
