# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

for i in 0..20 do
  User.create(firstname: "testuser", lastname: "testuser", email: "testuser#{i}@asdf.com", password: "password", admin: 0)
end