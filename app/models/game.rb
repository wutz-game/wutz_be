class Game < ApplicationRecord
  has_many :game_questions
  has_many :questions, through: :game_questions
  has_many :user_games
  has_many :user_answers, through: :user_games
  
  validates :orig_date, presence: true
end
