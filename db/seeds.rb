# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#Creates Questions in the database based on a category ID and a point value

# def question_create(cat, points)
#     response = JApiService.new.get_clues(cat, points).each do |clue|
#         Question.create(clue)
#     end
# end

# Array for allowed categories by ID
# categories = [67,23,54]

#Create questions for each category, at 3 difficulty levels
# categories.each do |cat|
#     question_create(cat, 100)
#     question_create(cat, 300)
#     question_create(cat, 800)
# end