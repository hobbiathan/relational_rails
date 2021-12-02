

# This file should contain all the record creation needed to seed the database with its default values.



# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@riogrande = Company.create!(name: "Rio Grande", games_listed: 3, independent: false)
@puerto = @riogrande.boardgames.create!(name: 'Puerto Rico', rank: 13, out_of_print: false)
@catan = @riogrande.boardgames.create!(name: 'Catan', rank: 7, out_of_print: false)
