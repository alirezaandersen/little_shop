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
    animals_total = contents["animals"] ? contents["animals"].values.sum : 0
    accessories_total = contents["accessories"] ? contents["accessories"].values.sum : 0
    animals_total + accessories_total
  end

end
