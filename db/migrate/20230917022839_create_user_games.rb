class CreateUserGames < ActiveRecord::Migration[7.0]
  def change
    create_table :user_games do |t|
      t.references :game, null: false, foreign_key: true
      t.integer :user_id
      t.timestamps
    end
  end
end
