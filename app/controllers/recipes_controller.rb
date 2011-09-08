class RecipesController < ApplicationController

  before_filter :authenticate, :only => [:create, :destroy]

  def index
  	@recipes = Recipe.public.paginate(:page => params[:page], :per_page => 30)
  end

  def show
  	@recipe = Recipe.find(params[:id])
  end

  def new
  	@recipe = current_user.recipes.new
  end

  def edit
  	@recipe = current_user.recipes.find(params[:id])
  end

  def update
    @recipe = current_user.recipes.find(params[:id])
    @recipe.update_attributes(params[:recipe])

    if @recipe.save
      @recipe.reload
      flash[:notice] = "recipe saved!"
      redirect_to edit_recipe_path(@recipe)
    else
      render :nothing => true
    end
  end

  def create
	  @recipe = current_user.recipes.new(params[:recipe])
    @recipe.name = @recipe.name.downcase
	  if @recipe.save
      @recipe.reload
	    flash[:notice] = "recipe created!"
	    redirect_to edit_recipe_path(@recipe)
	  else
	    render :action => 'new'
	  end
	end

  def destroy
    @recipe = current_user.recipes.find(params[:id])
    
    if @recipe.destroy
      redirect_to user_path(current_user)
    else
      redirect_to user_path(current_user)
    end
  end

  def toggle
    @user = User.find_by_id(params[:user_id])
    recipe = Recipe.find(params[:id])
    
    recipe.toggle(:public)
    recipe.save

    if(@user == current_user) 
      @recipes = @user.recipes.paginate(:page => params[:page], :per_page => 30)
    else
      @recipes = @user.recipes.public.paginate(:page => params[:page], :per_page => 30)
    end

    respond_to do |format|
      format.js
    end
  end

  def prioritize
    @recipe = Recipe.find(params[:id])
    steps = @recipe.steps
    steps.each do |step|
      step.step_num = params['step'].index(step.id.to_s) + 1
      step.save
    end
    
    @recipe.build_tag_list
    @recipe.save

    respond_to do |format|
      format.js
    end
  end
end
