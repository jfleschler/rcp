module RecipesHelper

	def new_step
		nextNum = @recipe.steps.count + 1
		@recipe.steps.create({:step_num => nextNum})
	end

	def new_step_button(recipe)
		button_to "new step", new_recipe_step_path(recipe), :class => 'btn primary', :method => 'get', :remote => true
	end
end
