class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.integer :step_num
      t.string :note
      t.integer :recipe_id

      t.timestamps
    end
  end
end
