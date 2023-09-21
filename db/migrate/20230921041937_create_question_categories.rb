class CreateQuestionCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :question_categories do |t|
      t.string :name
      t.string :emoji, default: "❓"
      t.integer :jservice_id
      t.timestamps
    end
  end
end
