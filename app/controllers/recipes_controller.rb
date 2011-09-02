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

  def update
    @recipe = Recipe.find(params[:id])
    if params[:toggle]
      @recipe.toggle(:public)
      @recipe.save
    end
    
    @user = User.find(params[:user_id])
    if @user == current_user
      @recipes = @user.recipes.all
    else
      @recipes = @user.recipes.public
    end
    respond_to do |format|
      format.html { redirect_to edit_recipe_path(@recipe) }
      format.js
    end
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
