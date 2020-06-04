# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

users = User.create!([
  {
    first_name: "Kristin",
    last_name: "Jones",
    username: "kristin",
    email: "kristin@example.com",
    password: "testtest",
    photo: "https://images.pexels.com/photos/862848/pexels-photo-862848.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"
  },
  {
    first_name: "Jane",
    last_name: "Jones",
    username: "jane",
    email: "jane@example.com",
    password: "testtest",
    photo: "https://images.pexels.com/photos/1090393/pexels-photo-1090393.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"
  },
  {
    first_name: "Mel",
    last_name: "Jones",
    username: "mel",
    email: "mel@example.com",
    password: "testtest",
    photo: "https://images.pexels.com/photos/569163/pexels-photo-569163.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"
  },
  {
    first_name: "Flo",
    last_name: "Jones",
    username: "flo",
    email: "flo@example.com",
    password: "testtest",
    photo: "https://images.pexels.com/photos/40815/youth-active-jump-happy-40815.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"
  },
  {
    first_name: "Angela",
    last_name: "Jones",
    username: "angela",
    email: "angela@example.com",
    password: "testtest",
    photo: "https://images.pexels.com/photos/247204/pexels-photo-247204.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"
  }
])

puts 'Users:'
users.each do |user|
  puts "#{user.username}"
end


