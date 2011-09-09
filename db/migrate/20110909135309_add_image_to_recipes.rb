class AddImageToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :image, :string, :default => 'recipe_placeholder.png'
  end
end
