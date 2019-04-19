# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# @users = User.create!([{first_name: "Amith", last_name: "Murakonda", email: "amithmurakonda@gamil.com", password: "amith123", confirm: true, confirm_code: nil, salt: "$2a$10$WFVWNZhA2572N0.NLkTmve"}])

@quotes = Quote.create!([
    {quote: "Change your life today. Don't gamble on the future, act now, without delay", author: "Simone de Beauvoir"} ,
    {quote: "It always seems impossible until it's done", author: "Nelson  Mandela"}])
