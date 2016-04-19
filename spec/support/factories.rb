FactoryGirl.define do
  factory :animal do
    name
    breed
    age
    sex
    size
    activity_level
    house_trained
    spayed_neutered
    special_needs
    available
    description
    image_path "http://alirezaandersen.github.io/images/ziba_gets_dirty.jpg"
  end

  sequence :name do |n|
    "#{n}"
  end

  sequence :breed do |b|
    "#{b}"
  end

  sequence :age, [0,1,2,3,4].cycle do |a|
    "#{a}"
  end

  sequence :sex, [0,1].cycle do |s|
    "#{s}"
  end

  sequence :size, [0,1,2,3,4].cycle do |si|
    "#{si}"
  end

  sequence :activity_level, [0,1,2,3,4].cycle do |al|
    "#{al}"
  end

  trait :house_trained do
    house_trained true
  end

  trait :spayed_neutered do
    spayed_neutered true
  end

  trait :special_needs do
    special_needs false
  end

  trait :available do
    available true
  end

  sequence :description do

  end


end
