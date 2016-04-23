class Animal < ActiveRecord::Base
  belongs_to :species

  has_many :favorites
  has_many :animal_visits

  validates_presence_of :name,
                        :breed,
                        :sex,
                        :size,
                        :age,
                        :activity_level,
                        :house_trained,
                        :spayed_neutered,
                        :available,
                        :description,
                        :species_id,
                        :image_path

  enum sex: ["Male", "Female"]
  enum size: ["Toy", "Small", "Medium", "Large", "Extra Large"]
  enum age: ["Baby", "Young", "Adult", "Senior"]
  enum activity_level: ["Couch Potato", "Jogger", "Sprinter"]

end
