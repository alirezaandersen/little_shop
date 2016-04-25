# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
dogs = [
  "http://g-ecx.images-amazon.com/images/G/01/img15/pet-products/small-tiles/23695_pets_vertical_store_dogs_small_tile_8._CB312176604_.jpg",
  "http://az616578.vo.msecnd.net/files/2016/03/13/6359346621543673841267054763_pup.jpg",
  "http://goldenstateservicedogs.com/wp-content/uploads/2015/04/c50bdb2e-95bc-4423-862f-83e949001fbf.jpg",
  "https://www.purina.com/media/629192/seo-article-14-list-grid.jpg/372/299/center/middle",
  "https://www.petfinder.com/images/breeds/dog/2330.jpg",
  "http://barkpost.com/wp-content/uploads/2014/07/Emotion-motion-by-Jelly-Dude-via-Flickr.jpg",
  "http://www.pedigree.com/All-Things-Dog/Images/article_img/do-dogs-dream.jpg",
  "http://www.petwave.com/~/media/Images/Center/Health/Dog/Oral/oral2/Dog-Close-Up-Mouth.ashx",
  "http://blog.petmeds.com/wp-content/uploads/2015/12/Dogs-scoot-for-a-variety-of-reasons.jpg",
  "http://a-z-animals.com/media/animals/images/original/dog5.jpg"
  ]

cats = [
  "https://www.petfinder.com/wp-content/uploads/2013/09/cat-black-superstitious-fcs-cat-myths-162286659.jpg",
  "https://cuteoverload.files.wordpress.com/kitteh_puddle-1312.jpg",
  "http://media4.popsugar-assets.com/files/2014/08/08/878/n/1922507/caef16ec354ca23b_thumb_temp_cover_file32304521407524949.xxxlarge/i/Funny-Cat-GIFs.jpg",
  "http://boredomtherapy.com/wp-content/uploads/2014/05/cat-fur-markings-1.jpg",
  "http://cbsnews1.cbsistatic.com/hub/i/r/2016/03/23/38e32f54-b910-4612-8852-be9e0fbdbf73/thumbnail/620x350/440a1273973991f75a0ac768f554e37c/cat-istock.jpg",
  "http://cdn1.theodysseyonline.com/files/2015/11/19/635835725242453246248519616_cat_1-jpg.jpg",
  "http://homepages.uc.edu/~burgesmr/catanddog/Cats/2.jpg",
  "http://superbpix.com/files/funzug/imgs/walls/big/cute_cats_wal_03.jpg",
  "http://rufflifechicago.com/wp-content/uploads/cat-treats.jpg",
  "https://upload.wikimedia.org/wikipedia/en/3/3a/Freddie4.jpg"
  ]

  10.times do |i|
    Animal.create(species: Species.find_or_create_by(name: "dogs"),
                  name: "dog #{i+ 1}",
                  age: i % 4,
                  breed: "breed #{i}",
                  size: i % 5,
                  sex: i % 2,
                  special_needs: false,
                  house_trained: true,
                  available: true,
                  spayed_neutered: true,
                  activity_level: i % 3,
                  image_path: dogs[i],
                  description: "Well hello! I'm Lucy Goosey, a stunning Lab mix lady born in 2013. I currently weigh in at 56 pounds. I am an intelligent lady who is very food motivated and eager to please. I am well-versed in basic commands such as 'sit' and 'down'. I'd love a home where my family is home a fair amount of the time, so I don't have to entertain myself by getting into the trash. I can be very protective of my food, feel free to ask the front desk for more information about this. If there are any kids in your home, I prefer they be older so they can understand my relationship with food. I'm an active lady who would love to be your new running or hiking buddy! Physical and mental stimulation will be key to keeping me happy and a stand-up canine citizen! Ask the front desk to meet me today!"
                  )
    puts "Dog #{i + 1} created"
  end

  Animal.create(species: Species.find_or_create_by(name: "dogs"),
                name: "reggie",
                age: 2,
                breed: "Black Lab",
                size: 2,
                sex: 0,
                special_needs: false,
                house_trained: true,
                available: false,
                spayed_neutered: true,
                activity_level: 2,
                image_path: "https://upload.wikimedia.org/wikipedia/commons/a/a6/Black_lab.JPG",
                description: "Well hello! I'm Lucy Goosey, a stunning Lab mix lady born in 2013. I currently weigh in at 56 pounds. I am an intelligent lady who is very food motivated and eager to please. I am well-versed in basic commands such as 'sit' and 'down'. I'd love a home where my family is home a fair amount of the time, so I don't have to entertain myself by getting into the trash. I can be very protective of my food, feel free to ask the front desk for more information about this. If there are any kids in your home, I prefer they be older so they can understand my relationship with food. I'm an active lady who would love to be your new running or hiking buddy! Physical and mental stimulation will be key to keeping me happy and a stand-up canine citizen! Ask the front desk to meet me today!"
                )
  puts "reggie created"

10.times do |i|
  Animal.create(species: Species.find_or_create_by(name: "cats"),
                name: "cat #{i + 1}",
                age: i % 4,
                breed: "breed #{i}",
                size: i % 5,
                sex: i % 2,
                special_needs: false,
                house_trained: true,
                available: true,
                spayed_neutered: true,
                activity_level: i % 3,
                image_path: cats[i],
                description: "
Well hello! I'm Lucy Goosey, a stunning Lab mix lady born in 2013. I currently weigh in at 56 pounds.

I am an intelligent lady who is very food motivated and eager to please. I am well-versed in basic commands such as 'sit' and 'down'. I'd love a home where my family is home a fair amount of the time, so I don't have to entertain myself by getting into the trash. I can be very protective of my food, feel free to ask the front desk for more information about this. If there are any kids in your home, I prefer they be older so they can understand my relationship with food. I'm an active lady who would love to be your new running or hiking buddy! Physical and mental stimulation will be key to keeping me happy and a stand-up canine citizen!

Ask the front desk to meet me today!"
                )
  puts "Cat #{i + 1} created"
end
