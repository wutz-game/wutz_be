class CreateAnsweredQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :answered_questions do |t|
      t.references :user_game, null: false, foreign_key: true
      t.string :answer
      t.string :question
      t.string :result
      t.timestamps
    end
  end
end
