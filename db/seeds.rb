# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Role.create(name: "admin")
Role.create(name: "user")

u = User.new
u.email = "admin@gmail.com"
u.password = "123456"
u.save

p = Permission.new
p.role_id = 1
p.user_id = 1
p.save

user1 = User.new
user1.email = "user1@gmail.com"
user1.password = "123456"
user1.save
user1.roles.push(Role.last)