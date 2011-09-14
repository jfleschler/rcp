class AddSettingsToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :cook_temp, :string
    add_column :recipes, :cook_time, :string
  end
end
