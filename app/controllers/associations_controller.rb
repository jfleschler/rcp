class AssociationsController < ApplicationController
 
  def new
  	@recipe = Recipe.find(params[:associations][:recipe])
  	step = Step.find(params[:associations][:activeStep])
  	step.associations.create({:ingredient_id => params[:associations][:selectedIngredient],
	  						  :amount        => "#{params[:associations][:amount]} #{params[:associations][:amount_unit]}",
	  						  :position      => step.associations.count + 1})

  	respond_to do |format|
	    format.html { redirect_to edit_recipe_path(@recipe) }
	    format.js
    end
  end

  def update
  	association = Association.find(params[:id])
	step = Step.find(association.step_id)
  	@recipe = Recipe.find(step.recipe_id)

  	current_pos = association.position

  	if(params[:move] == 'left')
  		swap_with = step.associations.find_by_position(current_pos - 1)
  		swap_with.position += 1;
  		swap_with.save
  		association.position -= 1;
		association.save

  	elsif (params[:move] == 'right')
  	  	swap_with = step.associations.find_by_position(current_pos + 1)
  		swap_with.position -= 1;
  		swap_with.save
  		association.position += 1;
		association.save
  	end
	
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
