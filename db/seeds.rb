# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name:  "theia-root",
             email: "theia-root@theia.io",
             password: "theia123",
             password_confirmation: "theia123",
             admin_level: 1,
             activated: true,
             activated_at: Time.zone.now)
#
# User.create!(name:  "theia-dev",
#              email: "theia-dev@theia.io",
#              password: "theia123",
#              password_confirmation: "theia123",
#              admin_level: 1,
#              activated: true,
#              activated_at: Time.zone.now)
#
# User.create!(name:  "theia-manager",
#              email: "theia-manager@theia.io",
#              password: "theia123",
#              password_confirmation: "theia123",
#              admin_level: 1,
#              activated: true,
#              activated_at: Time.zone.now)
#
# User.create!(name:  "theia-tester",
#              email: "theia-tester@theia.io",
#              password: "theia123",
#              password_confirmation: "theia123",
#              admin_level: 1,
#              activated: true,
#              activated_at: Time.zone.now)
#
# # Generate Company Managers
# 10.times do |n|
#   name      = Faker::Name.name
#   email     = "example-#{n+1}@theia.io"
#   password  = "password"
#   User.create!(name: name,
#                email: email,
#                password: password,
#                password_confirmation: password,
#                admin_level: 20,
#                activated: true,
#                activated_at: Time.zone.now)
# end
#
#
# # Generate Companies
# 10.times do |n|
#   name      = Faker::Company.name
#   # owner_id  = User.order("RANDOM()").limit(1).pluck(:id)[0] # will use this for Projects
#   owner_id = n + 1
#   Company.create!(name: name,
#                   owner_id: owner_id)
# end