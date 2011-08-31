class AssociationsController < ApplicationController
 
  def new
  	@recipe = Recipe.find(params[:associations][:recipe])
  	step = Step.find(params[:associations][:activeStep])
  	step.associations.create({:ingredient_id => params[:associations][:selectedIngredient],
	  						  :amount        => "#{params[:associations][:amount]} #{params[:associations][:amount_unit]}"})

  	respond_to do |format|
	    format.html { redirect_to edit_recipe_path(@recipe) }
	    format.js
    end
  end

  def destroy
  	association = Association.find(params[:id])
  	step = Step.find(association.step_id)
  	@recipe = Recipe.find(step.recipe_id)

  	association.destroy()

  	respond_to do |format|
	    format.html { redirect_to edit_recipe_path(@recipe) }
	    format.js
    end
  end
end
