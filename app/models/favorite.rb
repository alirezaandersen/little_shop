class Favorite
  attr_accessor :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def add_animal(animal_id)
    contents[animal_id.to_s] ||= 0
    if contents[animal_id.to_s] == 0
      contents[animal_id.to_s] += 1
      "#{ Animal.find(animal_id).name} added to favorites!"
    else
      "You can't favorite the same pet twice"
    end
  end

  def total
    contents.count
  end

  def remove_item(animal_id, visit)
    contents.delete(animal_id.to_s)
    visit.contents.delete(animal_id.to_s)
  end

  def animals
    Animal.find(contents.keys)
  end


end
