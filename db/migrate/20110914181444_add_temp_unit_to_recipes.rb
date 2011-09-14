class AddTempUnitToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :temp_unit, :string
  end
end
