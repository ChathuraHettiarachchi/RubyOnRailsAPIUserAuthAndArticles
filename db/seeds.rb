# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
puts "1 Admin User created"

2.times do |user|
  User.create!(
      name: "User #{user}",
      address: Faker::Book.title,
      email: "member.#{user}@gmail.com",
      password: 'password',
      password_confirmation: 'password'
  )
end
puts "2 Users created"

10.times do |article|
  Article.create!(
      title: Faker::Lorem.sentence(1 + article),
      body: Faker::Lorem.sentence(100),
      user_id: User.first.id
  )
end
puts "10 ArticlesController created"