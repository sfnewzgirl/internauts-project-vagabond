User.destroy_all
Post.destroy_all
City.destroy_all

users = User.create([
	{
	name: 'Misha LeClair',
	current_city: 'San Francisco',
	join_date: nil,
	email: 'misha@ga.com',
	password: '1234'
	},
	{
	name: 'Zach Fong',
	current_city: 'San Francisco',
	join_date: nil,
	email: 'zach@ga.com',
	password: '1234'
	},
	{
	name: 'Mikey Rogachevsky',
	current_city: 'San Francisco',
	join_date: nil,
	email: 'mikey@ga.com',
	password: '1234'
	},
	{
	name: 'Sera Bak',
	current_city: 'San Francisco',
	join_date: nil,
	email: 'sera@ga.com',
	password: '1234'
	}

])

City.create({
	name: 'San Francisco',
	photo: 'http://i.imgur.com/ajX0DZy.jpg'
	})

City.create({
	name: 'London',
	photo: 'http://i.imgur.com/WCqGb9A.jpg'
	})

City.create({
	name: 'Gibraltar',
	photo: 'http://i.imgur.com/m5el2ZK.jpg'
	})

x = 1
3.times do
	Post.create({
		title: 'Best Food',
	  	author: 'Misha LeClair',
	  	content: FFaker::Lorem.paragraph,
	  	user_id: 1,
	  	city_id: x
	  	})
	x += 1
end

y = 1
3.times do
	Post.create({
		title: 'Best Hospitals',
	  	author: 'Zach Fong',
	  	content: FFaker::Lorem.paragraph,
	  	user_id: 2,
	  	city_id: y
	  	})
	y += 1
end

z = 1
3.times do
	Post.create({
		title: 'Best Hipster Neighborhoods',
	  	author: 'Mikey Rogachevsky',
	  	content: FFaker::Lorem.paragraph,
	  	user_id: 3,
	  	city_id: z
	  	})
	z += 1
end

a = 1
3.times do
	Post.create({
		title: 'Best Music Venues',
	  	author: 'Sera Bak',
	  	content: FFaker::Lorem.paragraph,
	  	user_id: 4,
	  	city_id: a
	  	})
	a += 1
end
