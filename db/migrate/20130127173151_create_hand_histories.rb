class CreateHandHistories < ActiveRecord::Migration
  def change
    create_table :hand_histories do |t|
      t.integer :game_id
      t.text :log

      t.timestamps
    end
  end
end
