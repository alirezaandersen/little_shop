class Cart

  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def add_animal(animal_id)
    contents[animal_id.to_s] ||= 0
    if total < 2
      if contents[animal_id.to_s] != 1
      contents[animal_id.to_s] += 1
      "You're about to adopt #{ Animal.find(animal_id).name}"
      else
        "You can't adopt the same pet twice"
      end
    else
      "You can't adopt more than 2 pets"
    end
  end


  def total
    binding.pry
    contents.values.sum
  end

  def remove_item(animal_id)
    contents.delete(animal_id.to_s)
  end

end
