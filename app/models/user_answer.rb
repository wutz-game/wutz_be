class UserAnswer < ApplicationRecord
  belongs_to :user_game

  validates :answer, presence: true
  validates :user_game_id, presence: true
  validates :question, presence: true
  validates :result, presence: true
end
