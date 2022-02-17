# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

Movie.destroy_all

url = 'http://tmdb.lewagon.com/movie/top_rated'
top_serialized = URI.open(url).read
top = JSON.parse(top_serialized)

top['results'].each do |movie|
  if movie['original_language'] == 'en'
    movie_create = Movie.create(title: movie['original_title'], overview: movie['overview'], poster_url: "https://www.themoviedb.org/t/p/w1280#{movie['poster_path']}", rating: movie['vote_average'])
    puts movie_create.title
    puts movie_create.rating
  end
end
