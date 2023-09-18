class CreateAnsweredQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :answered_questions do |t|
      t.references :user_game, null: false, foreign_key: true
      t.string :answer
      t.string :question
      t.integer :result, default: 0
      t.timestamps
    end
  end
end
