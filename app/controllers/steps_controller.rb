class StepsController < ApplicationController
  def show
  	@step = Step.find(params[:id])
  end

  def new 
  	@recipe = Recipe.find(params[:recipe_id])
  	nextNum = @recipe.steps.count + 1
  	@recipe.steps.create({:step_num => nextNum})

  	respond_to do |format|
	    format.html { redirect_to edit_recipe_path(@recipe) }
	    format.js
    end
  end

  def destroy

    step = Step.find(params[:id])
    @recipe = step.recipe
    step.destroy()

    respond_to do |format|
      format.html { redirect_to edit_recipe_path(@recipe) }
      format.js
    end
  end
end
