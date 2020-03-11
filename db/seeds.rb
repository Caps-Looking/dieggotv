# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Package.create(name: 'Basic', price: 50.0)
Package.create(name: 'Intermediate', price: 100.0)
Package.create(name: 'Advanced', price: 150.0)

AdditionalService.create(name: 'Premiere FC', price: 60.0)
AdditionalService.create(name: 'Combate', price: 70.0)
AdditionalService.create(name: 'Telecine', price: 80.0)