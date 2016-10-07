# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Post.destroy_all

3.times do
User.create({
	name: FFaker::Name.name,
	current_city: 'SF',
	join_date: nil,
	email: FFaker::Internet.email,
	password: '1234'
	})
end


3.times do
Post.create({title: "Some Title",
  author: FFaker::Name.name,
  content: FFaker::HipsterIpsum.paragraph,
  user_id: 1})
end


City.create({
	name: 'San Francisco',
	photo: 'default.jpeg'
	})

City.create({
	name: 'London',
	photo: 'default.jpeg'
	})

City.create({
	name: 'Gibralter',
	photo: 'default.jpeg'
	})