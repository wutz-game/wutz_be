class AddGameQuestionToUserAnswer < ActiveRecord::Migration[7.0]
  def change
    add_reference :user_answers, :game_question, null: false, foreign_key: true
  end
end
