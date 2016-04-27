class Animal < ActiveRecord::Base
  belongs_to :species
  has_many :favorites
  has_many :animal_visits
  before_validation :capitalize_name

  validates_presence_of :name,
                        :breed,
                        :sex,
                        :size,
                        :age,
                        :activity_level,
                        :description,
                        :species_id,
                        :image_path

  enum sex: ["Male", "Female"]
  enum size: ["Toy", "Small", "Medium", "Large", "Extra Large"]
  enum age: ["Baby", "Young", "Adult", "Senior"]
  enum activity_level: ["Couch Potato", "Jogger", "Sprinter"]

  def capitalize_name
    self.name = self.name.capitalize
  end

  #Overwriting default accessors
  #http://api.rubyonrails.org/classes/ActiveRecord/Base.html
  #overriding setter methods for default columns accessors because
  #f.collection_select returns enum values as strings when integer
  #required

  def sex=(val)
    super(val.to_i)
  end

  def size=(val)
    super(val.to_i)
  end

  def age=(val)
    super(val.to_i)
  end

  def activity_level=(val)
    super(val.to_i)
  end
end
