# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do |i|
  Animal.create(species: Species.new(name: "cats"),
                name: "cat #{i + 1}",
                age: "#{i % 5}",
                breed: "breed #{i}",
                size: "#{i % 5}",
                sex: "#{i % 2}",
                special_needs: false,
                house_trained: true,
                available: true,
                spayed_neutered: true,
                activity_level: "#{i % 3}",
                image_path: "http://www.medhatspca.ca/sites/default/files/news_photos/2014-Apr-15/node-147/cute-little-cat.jpg"
                )
  puts "Cat #{i + 1} created"
end

10.times do |i|
  Animal.create(species: Species.new(name: "dogs"),
                name: "dog #{i+ 1}",
                age: "#{i % 5}",
                breed: "breed #{i}",
                size: "#{i % 5}",
                sex: "#{i % 2}",
                special_needs: false,
                house_trained: true,
                available: true,
                spayed_neutered: true,
                activity_level: "#{i % 3}",
                image_path: "http://az616578.vo.msecnd.net/files/2016/03/13/6359346621543673841267054763_pup.jpg"
                )
  puts "Dog #{i + 1} created"
end
