class Question < ApplicationRecord
  belongs_to :game
  validates :clue, :answer, :category, :clue_id, :value, :category_id, :game_id, presence: true
end
