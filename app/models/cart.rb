class Cart

  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {animals: {}, accessories: {}}
  end

  def add_animal(animal_id)
    contents[:animals][animal_id] ||= 0
    contents[:animals][animal_id] += 1
    contents[:accessories] ||= {}
  end

  def add_accessory(accessory_id)
    contents[:accessories][accessory_id] ||= 0
    contents[:accessories][accessory_id] += 1
    contents[:animals] ||= {}
  end

  def total
    @cart ? contents[:animals].values.sum + contents[:accessories].values.sum : 0
  end

end
