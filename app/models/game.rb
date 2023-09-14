class Game < ApplicationRecord
  has_many :game_questions
  has_many :questions, through: :game_questions
  validates :orig_date, presence: true
end
