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

  enum sex: [:male, :female]
  enum size: [:toy, :small, :medium, :large, :extra_large]
  enum age: [:baby, :young, :adult, :senior]
  enum activity_level: [:couch_potato, :jogger, :sprinter]

end
