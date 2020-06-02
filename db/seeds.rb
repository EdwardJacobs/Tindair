# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([
  {first_name: "Kristin", last_name: "Jones", username: "kristin", email: "kristin@example.com", password: "testtest"},
  {first_name: "Jane", last_name: "Jones", username: "jane", email: "jane@example.com", password: "testtest"},
  {first_name: "Mel", last_name: "Jones", username: "mel", email: "mel@example.com", password: "testtest"},
  {first_name: "Flo", last_name: "Jones", username: "flo", email: "flo@example.com", password: "testtest"},
  {first_name: "Angela", last_name: "Jones", username: "angela", email: "angela@example.com", password: "testtest"}
])
