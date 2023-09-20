class UserGame < ApplicationRecord
    has_many :user_answers
    belongs_to :game

    validates :user_id, presence: true
    validates :game_id, presence: true
end
