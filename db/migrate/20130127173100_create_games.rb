class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :bot1_id
      t.integer :bot2_id

      t.timestamps
    end
  end
end
