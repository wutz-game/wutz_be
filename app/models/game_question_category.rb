class GameQuestionCategory < ApplicationRecord
  belongs_to :game
  belongs_to :question_category
end
