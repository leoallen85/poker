class AddNameToBot < ActiveRecord::Migration
  def change
    add_column :bots, :name, :string
  end
end
