class RecipesController < ApplicationController
  def index
  	@recipes = Recipe.all
  end

  def show
  	@recipe = Recipe.find(params[:id])
  end

  def new
  	@recipe = Recipe.new
  end

  def edit
  	@recipe = Recipe.find(params[:id])
  end

  def create
	  @recipe = Recipe.new(params[:recipe])
    @recipe.name = @recipe.name.downcase
	  if @recipe.save
	    flash[:notice] = "recipe created!"
	    redirect_to edit_recipe_path(@recipe)
	  else
	    render :action => 'new'
	  end
	end
end
