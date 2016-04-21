class Cart

  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def add_animal(animal_id)
    contents[animal_id.to_s] ||= 0
    if contents[animal_id.to_s] != 1
    contents[animal_id.to_s] += 1
    "#{ Animal.find(animal_id).name} added to favorites!"
    else
      "You can't favorite the same pet twice"
    end
  end

  def total
    contents.values.sum
  end

  def remove_item(animal_id)
    contents.delete(animal_id.to_s)
  end

end
