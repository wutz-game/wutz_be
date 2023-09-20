class ChangeAnswerToUserAnswerInUserAnswers < ActiveRecord::Migration[7.0]
  def change
    rename_column :user_answers, :answer, :user_answer
  end
end
