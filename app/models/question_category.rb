class QuestionCategory < ApplicationRecord
  has_many :game_question_categories
  has_many :games, through: :game_question_categories

  validates :name, :emoji, :jservice_id, presence: true
  validates :jservice_id, uniqueness: true
end