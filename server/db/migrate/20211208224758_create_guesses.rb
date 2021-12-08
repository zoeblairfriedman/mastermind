class CreateGuesses < ActiveRecord::Migration[6.1]
  def change
    create_table :guesses do |t|
      t.string :input
      t.integer :game_id
      t.timestamps
    end
  end
end
