class AddMakesToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :makes, :string
  end
end
