class Question < ApplicationRecord
  has_many :game_questions
  has_many :games, through: :game_questions
  validates :clue, :answer, :category, :clue_id, :value, :category_id, presence: true
end