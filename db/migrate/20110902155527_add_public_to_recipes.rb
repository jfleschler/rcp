class AddPublicToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :public, :boolean, :default => 0
  end
end
