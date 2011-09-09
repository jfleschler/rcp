class AddOwnerToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :user_id, :integer
    add_column :recipes, :has_ingredient, :integer
  end
end
