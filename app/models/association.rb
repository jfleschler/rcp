class Association < ActiveRecord::Base
	belongs_to :ingredient
	belongs_to :step

	before_destroy :renumber_remaining

	default_scope :order => 'position'

	def ingredient
		Ingredient.find(ingredient_id)
	end

	private

		def renumber_remaining
			step = Step.find(step_id)
			step.associations.each do |a|
				if(a.position > position)
					a.position = a.position - 1
					a.save
				end
			end
		end
end
