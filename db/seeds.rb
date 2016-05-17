# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Team.create([team_name: 'Demo Team', email: 'demo@gmail.com', password: 'password'])

Team.first.users.create([{ name: 'testguy1', number: '8018242592' },
                          { name: 'testguy2', number: '8018242592'},
                          { name: "testgirl1", number: '8018242592', girl: true },
                          { name: 'testgirl2', number: '8018242592', girl: true}])