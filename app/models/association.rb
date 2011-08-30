class Association < ActiveRecord::Base
	belongs_to :ingredient
	belongs_to :step

	def ingredient
		Ingredient.find(ingredient_id)
	end

end
