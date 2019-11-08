# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

r = Recruiter.find_or_create_by(email: "r@gmail.com")
r.update(password: "password", password_confirmation: "password")
j = JobSeeker.find_or_create_by(email: "j@gmail.com")
j.update(password: "password", password_confirmation: "password")