class UserAnswer < ApplicationRecord
  belongs_to :user_game
  belongs_to :game_question

  validates :user_game_id, presence: true
  validates :game_question_id, presence: true
  validates :result, presence: true

  enum result: [ :incorrect, :correct, :self_corrected, :skipped ]

  def question
    game_question.question.clue
  end

  def answer
    game_question.question.answer
  end
end
