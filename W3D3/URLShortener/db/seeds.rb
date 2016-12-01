# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ActiveRecord::Base.transaction do

  user1 = User.create!(email: "one email")
  user2 = User.create!(email: "two email")
  user3 = User.create!(email: "three email")

  url1 = ShortenedUrl.create!(long_url: 'long1', short_url: 'short1', user_id: 1)
  url2 = ShortenedUrl.create!(long_url: 'long2', short_url: 'short2', user_id: 2)
  url3 = ShortenedUrl.create!(long_url: 'long3', short_url: 'short3', user_id: 3)

  visit1 = Visit.create!(short_url_id: 1, user_id: 1)
  visit2 = Visit.create!(short_url_id: 3, user_id: 1)
  visit3 = Visit.create!(short_url_id: 3, user_id: 2)
  visit4 = Visit.create!(short_url_id: 2, user_id: 3)
  visit5 = Visit.create!(short_url_id: 1, user_id: 3)
  visit6 = Visit.create!(short_url_id: 2, user_id: 3)
  visit7 = Visit.create!(short_url_id: 2, user_id: 2)

end
