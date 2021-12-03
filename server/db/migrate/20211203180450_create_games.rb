class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :answer
      t.integer :difficulty
      t.boolean :win
      t.integer :user_id

      t.timestamps
    end
  end
end
