# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


users = User.create([{ name: 'Dillon', number: '8018242592' },
                     { name: "Dillena", number: '8018242592', girl: true },
                     { name: 'dillon2', number: '8018242592'},
                     { name: 'dillena2', number: '8018242592', girl: true}])