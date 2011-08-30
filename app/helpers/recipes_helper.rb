module RecipesHelper

	def new_step
		nextNum = @recipe.steps.count + 1
		@recipe.steps.create({:step_num => nextNum})
	end
end
