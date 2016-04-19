class Cart

  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents
  end

  def add_animal(animal_id)
    contents["animals"] ||= {}
    contents["animals"][animal_id.to_s] ||= 0
    contents["animals"][animal_id.to_s] += 1
    contents["accessories"] ||= {}
  end

  def add_accessory(accessory_id)
    contents["accessories"] ||= {}
    contents["accessories"][accessory_id.to_s] ||= 0
    contents["accessories"][accessory_id.to_s] += 1
    contents["animals"] ||= {}
  end

  def total
    animal_total = contents["animals"] ? contents["animals"].values.sum : 0
    accessories_total = contents["accessories"] ? contents["accessories"].values.sum : 0
    animal_total + accessories_total
  end

  def remove_item(item, quantity = 1)
    if item.class == Animal
      contents["animals"][item.id.to_s] -= quantity
    elsif item.class == Accessory
      contents["accessories"][item.id.to_s] -= quantity
    end

  end

end
