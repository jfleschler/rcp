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

end
