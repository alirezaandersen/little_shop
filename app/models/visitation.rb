class Visitation
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def add_animal(animal_id)
    if total_animals < 3
      if contents[animal_id]
        "Can't add #{Animal.find(animal_id).name} twice."
      else
        contents[animal_id.to_s] = 15
        "#{ Animal.find(animal_id).name} added to visits!"
      end
    else
      "Can't add more than 3 animals to a visit"
    end
  end

  def increase_duration(animal_id)
    if contents[animal_id.to_s] < 60
      contents[animal_id.to_s] += 15
    end
  end

  def decrease_duration(animal_id)
    if contents[animal_id.to_s] > 15
      contents[animal_id.to_s] -= 15
    end
  end

  def total_animals
    contents.count
  end

  def total_duration
    contents.values.sum
  end

  def remove_item(animal_id)
    contents.delete(animal_id.to_s)
  end

end
