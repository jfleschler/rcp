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
    @user = User.find_by_id(params[:user_id])
    recipe = Recipe.find(params[:id])
    
    recipe.toggle(:public)
    recipe.save

    recipe.reload

    if(@user == current_user) 
      @recipes = @user.recipes.all
    else
      @recipes = @user.recipes.public
    end

    respond_to do |format|
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

  def prioritize
    @recipe = Recipe.find(params[:id])
    steps = @recipe.steps
    steps.each do |step|
      step.step_num = params['step'].index(step.id.to_s) + 1
      step.save
    end

    @recipe.reload
    respond_to do |format|
      format.js
    end
  end
end
