# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "json"
require "open-uri"

puts "Cleaning Data"
Bookmark.destroy_all
Movie.destroy_all
puts "Starting seeds"

url = "https://tmdb.lewagon.com/movie/top_rated"
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)

movies["results"].each do |movie|
  url = "#{"https://image.tmdb.org/t/p/w200"}#{movie["poster_path"]}"
  Movie.create(title: movie["title"], overview: movie["overview"], rating: movie["vote_average"], poster_url: url)
end
puts "#{Movie.count} created"

# img:
#      base_url             file_size        poster_path
# https://image.tmdb.org/t/p/w500/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg

# "title": "The Shawshank Redemption",
# "overview": "Framed in the 1940s..."
# "poster_path": "/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg",
# "vote_average": 8.7,
