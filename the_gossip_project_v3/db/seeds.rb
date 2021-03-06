require 'faker'

10.times do
	city = City.create!(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
end

10.times do
	user = User.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::RuPaul.quote, email: Faker::Internet.email, age: rand(15..40))
	user.city = City.all.sample
	user.save
end

20.times do
	gossip = Gossip.new(title: Faker::Music.band, content: Faker::StrangerThings.quote)
	gossip.user = User.all.sample
	gossip.save
end

10.times do
	tag = Tag.create!(title: Faker::Color.color_name)
end

20.times do
	join = JoinTableGossipTag.new
	join.gossip = Gossip.all.sample
	join.tag = Tag.all.sample
	join.save
end

5.times do
	pm = PrivateMessage.new(content: Faker::BojackHorseman.quote)
	pm.sender = User.all.sample
	pm.recipient = User.all.sample
	pm.save
end

20.times do
	com = Comment.new(content: Faker::BojackHorseman.quote)
	com.user = User.all.sample
	com.gossip = Gossip.all.sample
	com.save
end

6.times do
	like = Like.new
	like.user = User.all.sample
	like.gossip = Gossip.all.sample
	like.save
end

7.times do
	like = Like.new
	like.user = User.all.sample
	like.comment = Comment.all.sample
	like.gossip = Gossip.all.sample
	like.save
end

7.times do
	like = Like.new
	like.user = User.all.sample
	like.comment = Comment.all.sample
	like.save
end
