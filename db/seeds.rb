# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

admin = User.new(
  name: 'Admin User',
  email: 'admin@example.com',
  password: 'helloworld',
  role: 'admin'
)
admin.skip_confirmation!
admin.save!

member = User.new(
  name: 'Member user',
  email: 'moderator@example.com',
  password: 'helloworld',
  role: 'member'
)
member.skip_confirmation!
member.save

users = User.all

50.times do
  Item.create!(
    user: users.sample,
    name: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph,
    due_date: Faker::Date.forward(7),
    completed: false,
    created_at: Faker::Date.backward(14)
  )
end 

puts "#{User.count} users created"
puts "#{Item.count} to-do items created"
