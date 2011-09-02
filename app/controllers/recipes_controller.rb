class RecipesController < ApplicationController

  before_filter :authenticate, :only => [:create, :destroy]

  def index
  	@recipes = Recipe.public
  end

  def show
  	@recipe = Recipe.find(params[:id])
  end

  def new
  	@recipe = current_user.recipes.new
  end

  def edit
  	@recipe = Recipe.find(params[:id])
  end

  def create
	  @recipe = current_user.recipes.new(params[:recipe])
    @recipe.name = @recipe.name.downcase
	  if @recipe.save
	    flash[:notice] = "recipe created!"
	    redirect_to edit_recipe_path(@recipe)
	  else
	    render :action => 'new'
	  end
	end
end
