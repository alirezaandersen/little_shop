class Visit < ActiveRecord::Base

  belongs_to :user
  has_many :animal_visits
  has_many :animals, through: :animal_visits
  validates :duration, presence: true
  validates :user_id, presence: true
  validates :date, presence: true
  # validates :time, presence: true

  validate :date_cannot_be_in_the_past

  enum status: ["Scheduled", "Cancelled", "Confirmed", "Completed"]

  def date_cannot_be_in_the_past
    if date.present? && date <= Date.today
      errors.add(:date, "can't be in the past")
    end
  end

  def duration
    animal_visits.sum(:duration)
  end

  def cancelled?
    status == "Cancelled"
  end

  def completed?
    status == "Completed"
  end
end
