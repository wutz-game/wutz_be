class GameQuestion < ApplicationRecord
    belongs_to :question
    belongs_to :game
    validates :game_id, :question_id, presence: true
end