class AnsweredQuestion < ApplicationRecord
  belongs_to :user_game

  validates :answer, presence: true
  validates :user_game_id, presence: true
  validates :question, presence: true
  validates :result, presence: true

  enum result: [ :incorrect, :correct, :self_correct ]
end
