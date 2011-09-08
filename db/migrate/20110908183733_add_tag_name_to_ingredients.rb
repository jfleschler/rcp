class AddTagNameToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :tag_name, :string
  end
end
