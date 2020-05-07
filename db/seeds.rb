# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create!(
#     :email => 'john@gmail.com', 
#     :password => 'topsecret', 
#     :password_confirmation => 'topsecret'
# )
# puts "User created."


for i in 1..5
  Quote.create!(
    body: Faker::Quote.famous_last_words,
    author: Faker::Name.name,
    user_id: 1
  )
    #  l.picture.attach(io: File.open(Rails.root.join("app/assets/images/home_lizard.jpg")), 
    #  filename: "", content_type: "image/jpg")

    puts "Quote #{i} created."
end




