class AddSlugToBot < ActiveRecord::Migration
  def change
    add_column :bots, :slug, :string
    add_index :bots, :slug, unique: true
  end
end
