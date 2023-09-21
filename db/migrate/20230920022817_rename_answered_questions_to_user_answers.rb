class RenameAnsweredQuestionsToUserAnswers < ActiveRecord::Migration[7.0]
  def change
    rename_table :answered_questions, :user_answers
  end
end
