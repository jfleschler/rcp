class CreateAssociations < ActiveRecord::Migration
  def change
    create_table :associations do |t|
      t.integer :step_id
      t.integer :ingredient_id
      t.integer :position

      t.timestamps
    end
  end
end
