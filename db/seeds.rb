# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Idea.destroy_all
User.destroy_all

10.times do |num|
    full_name = Faker::TvShows::SiliconValley.character.split(' ')
    first_name = full_name[0]
    last_name = full_name[1]
    User.create(
      first_name: first_name,
      last_name: last_name,
      email: "#{first_name}.#{last_name}-#{num}@piedpiper.com",
      password: 'supersecret'
    )
  end
 
  users = User.all
10.times do
    Idea.create(
  
      title: Faker::Team.name,
      description: Faker::Hacker.say_something_smart,
      user: users.sample
    
    
    )
  end

  