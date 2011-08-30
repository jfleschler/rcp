class AddAmountToAssociations < ActiveRecord::Migration
  def change
    add_column :associations, :amount, :string
  end
end
