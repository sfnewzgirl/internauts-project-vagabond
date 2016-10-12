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
	photo: 'SF.jpeg'
	})

City.create({
	name: 'London',
	photo: 'london.jpeg'
	})

City.create({
	name: 'Gibraltar',
	photo: 'gibraltar.jpeg'
	})

x = 1
3.times do
	Post.create({
		title: 'Best Food',
	  	author: 'Misha LeClair',
	  	content: FFaker::BaconIpsum.paragraph,
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
	  	content: FFaker::HealthcareIpsum.paragraph,
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
	  	content: FFaker::HipsterIpsum.paragraph,
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
	  	content: FFaker::DizzleIpsum.paragraph,
	  	user_id: 4,
	  	city_id: a
	  	})
	a += 1
end
