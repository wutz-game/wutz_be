class CreateGameQuestionCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :game_question_categories do |t|
      t.references :game, null: false, foreign_key: true
      t.references :question_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
