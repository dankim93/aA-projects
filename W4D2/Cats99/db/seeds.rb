# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Cat.destroy_all
sam = Cat.create!(color: 'black', name: 'sam', sex: 'M', birth_date: '2011-2-15',
                  description: "sam is a lonely cat looking for a nice company")
dan = Cat.create!(color: 'white', name: 'dan', sex: 'M', birth_date: '2012-3-16',
                  description: "dan is a very cool cat, who is fat")
cindy = Cat.create!(color: 'brown', name: 'cindy', sex: 'F', birth_date: '2013-4-17',
                  description: "cindy is windy")
