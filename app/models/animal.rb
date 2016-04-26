class Animal < ActiveRecord::Base
  belongs_to :species
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

  # Overwriting default accessors
  # http://api.rubyonrails.org/classes/ActiveRecord/Base.html
  # overriding setter methods for default columns accessors because
  # f.collection_select returns enum values as strings when integer
  # required

  def sex=(val)
    val ? super(val.to_i) : super(val)
  end

  def size=(val)
    val ? super(val.to_i) : super(val)
  end

  def age=(val)
    val ? super(val.to_i) : super(val)
  end

  def activity_level=(val)
    val ? super(val.to_i) : super(val)
  end

  def capitalize_name
    name.capitalize! if name
  end

  def self.available?
    where(available: true)
  end
end
