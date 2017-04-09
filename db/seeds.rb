# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

CSV.foreach('db/csv/boards.csv') do |row|
  Board.create!(id: row[0], title: row[1], description: row[2])
end

CSV.foreach('db/csv/users.csv') do |row|
  User.create!(id: row[0], name: row[1], sex: row[2], age: row[3])
end

CSV.foreach('db/csv/comments.csv') do |row|
  Comment.create!(id: row[0], board_id: row[1], user_id: row[2], comment: row[3])
end
