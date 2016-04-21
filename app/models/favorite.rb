class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :animal

  validates: :animal_id, presence: true
  validates: :user_id, presence: true
end
