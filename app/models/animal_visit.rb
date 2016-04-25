class AnimalVisit < ActiveRecord::Base
  belongs_to :animal
  belongs_to :visit
end
