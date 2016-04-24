class Species < ActiveRecord::Base
  has_many :animals
  validates :name, presence: true
end
