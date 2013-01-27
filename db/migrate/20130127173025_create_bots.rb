class CreateBots < ActiveRecord::Migration
  def change
    create_table :bots do |t|
      t.text :code
      t.integer :user_id

      t.timestamps
    end
  end
end
