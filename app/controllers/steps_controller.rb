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

  def update
    step = Step.find(params[:id])
    @recipe = Recipe.find(step.recipe_id)

    current_pos = step.step_num

    if(params[:move] == 'up')
      swap_with = @recipe.steps.find_by_step_num(current_pos - 1)
      swap_with.step_num += 1;
      swap_with.save
      step.step_num -= 1;
      step.save

    elsif (params[:move] == 'down')
      swap_with = @recipe.steps.find_by_step_num(current_pos + 1)
      swap_with.step_num -= 1;
      swap_with.save
      step.step_num += 1;
      step.save
    end
  
    respond_to do |format|
      format.html { redirect_to edit_recipe_path(@recipe) }
      format.js
    end
  end

  def prioritize
    step = Step.find(params[:id])
    associations = step.associations
    associations.each do |association|
      association.position = params['association'].index(association.id.to_s) + 1
      association.save
    end
    render :nothing => true
  end
    
end
