class GameQuestion < ApplicationRecord
    belongs_to :question
    belongs_to :game
    has_many :user_answers

    validates :game_id, :question_id, presence: true
end