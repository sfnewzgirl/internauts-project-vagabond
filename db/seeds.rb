User.destroy_all
Post.destroy_all
City.destroy_all

users = User.create([
	{
	name: 'Misha LeClair',
	current_city: 'San Francisco',
	join_date: nil,
	email: 'misha@ga.com',
	password: '1234',
	avatar: File.open(File.join(Rails.root, 'db', 'fixtures', 'red-creature-icon.png'))
	},
	{
	name: 'Zach Fong',
	current_city: 'San Francisco',
	join_date: nil,
	email: 'zach@ga.com',
	password: '1234',
	avatar: File.open(File.join(Rails.root, 'db', 'fixtures', 'red-creature-icon.png'))
	},
	{
	name: 'Mikey Rogachevsky',
	current_city: 'San Francisco',
	join_date: nil,
	email: 'mikey@ga.com',
	password: '1234',
	avatar: File.open(File.join(Rails.root, 'db', 'fixtures', 'red-creature-icon.png'))
	},
	{
	name: 'Sera Bak',
	current_city: 'San Francisco',
	join_date: nil,
	email: 'sera@ga.com',
	password: '1234',
	avatar: File.open(File.join(Rails.root, 'db', 'fixtures', 'red-creature-icon.png'))
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
		title: "Some Title" + " " + x.to_s,
	  	author: 'Misha LeClair',
	  	content: FFaker::HipsterIpsum.paragraph,
	  	user_id: 1,
	  	city_id: x
	  	})
	x += 1
end

y = 1
3.times do
	Post.create({
		title: 'Some Title' + " "  + y.to_s,
	  	author: 'Zach Fong',
	  	content: FFaker::HipsterIpsum.paragraph,
	  	user_id: 2,
	  	city_id: y
	  	})
	y += 1
end

z = 1
3.times do
	Post.create({
		title: 'Some Title' + " "  + z.to_s,
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
		title: 'Some Title' + " "  + a.to_s,
	  	author: 'Sera Bak',
	  	content: FFaker::HipsterIpsum.paragraph,
	  	user_id: 4,
	  	city_id: a
	  	})
	z += 1
end
