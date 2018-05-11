# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{email: 'abc@gmail.com', password: 'suse1234', password_confirmation: 'suse1234'},
	{email: 'ab@gmail.com', password: 'suse1234', password_confirmation: 'suse1234'}])


stories = Story.create!([{title: 'This is fist story', content: 'This story contails all the details', user_id: users.first.id, all_tags: 'blog'},
	{title: 'This is second story', content: 'This second story contails all the details', user_id: users.last.id, all_tags: 'Tech'}])

