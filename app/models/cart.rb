class Cart

  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def add_animal(animal_id)
    # contents["animals"] ||= {}
    contents[animal_id.to_s] ||= 0
    contents[animal_id.to_s] += 1
    # contents["accessories"] ||= {}
  end
  #
  # def add_accessory(accessory_id)
  #   contents["accessories"] ||= {}
  #   contents["accessories"][accessory_id.to_s] ||= 0
  #   contents["accessories"][accessory_id.to_s] += 1
  #   contents["animals"] ||= {}
  # end

  def total
    contents["animals"].values.sum
  end

  def remove_item(animal_id)
    contents[item.id.to_s] -= 1
  end

end
