class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :clue
      t.string :answer
      t.string :category
      t.integer :clue_id
      t.integer :value
      t.integer :category_id
      t.timestamps
    end
  end
end
