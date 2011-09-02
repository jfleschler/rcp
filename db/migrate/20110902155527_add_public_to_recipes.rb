class AddPublicToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :public, :boolean, :default => false
  end
end
