# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([
  {first_name: "Krista", last_name: "Jones", username: "krista", email: "krista@example.com", password: "testtest", photo: 'https://www.santpaubarcelona.org/sites/default/files/styles/news_teaser/public/flickr/12835239003_0fda5fb8ab_1393612375.jpg?itok=U2gP9jjg'},
  {first_name: "Mariana", last_name: "Jones", username: "mariana", email: "mariana@example.com", password: "testtest"},
  {first_name: "Gisele", last_name: "Jones", username: "gisele", email: "gisele@example.com", password: "testtest"},
  {first_name: "Danica", last_name: "Jones", username: "danica", email: "danica@example.com", password: "testtest"},
  {first_name: "Angela", last_name: "Jones", username: "angela", email: "angela@example.com", password: "testtest"}
])
