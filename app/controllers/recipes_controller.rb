class RecipesController < ApplicationController

  before_filter :authenticate, :only => [:create, :destroy, :update]

  def index
  	@recipes = Recipe.public.paginate(:page => params[:page], :per_page => 30)
  end

  def show
  	@recipe = Recipe.find_by_id(params[:id])
    
    if signed_in?
      unless @recipe && (@recipe.public? || current_user.recipes.find_by_id(params[:id]))
        flash[:warning] = "sorry, recipe does not exist or is private!"
        redirect_to recipes_path
      end
    else
      unless @recipe && @recipe.public?
        flash[:warning] = "sorry, recipe does not exist or is private!"
        redirect_to recipes_path
      end
    end
  end

  def new
  	@recipe = current_user.recipes.new
  end

  def edit
  	@recipe = current_user.recipes.find(params[:id])
  end

  def update
    @recipe = current_user.recipes.find(params[:id])
    @recipe.name = params[:name]
    @recipe.cook_time = params[:cook_time]
    @recipe.cook_temp = params[:cook_temp] 
    @recipe.temp_unit = params[:temp_unit]
    @recipe.makes = params[:makes]
    
    if @recipe.save
      @recipe.reload
      #flash[:notice] = "recipe saved!"
      redirect_to edit_recipe_path(@recipe)
    else
      render :nothing => true
    end
  end

  def create
	  @recipe = current_user.recipes.new(params[:recipe])
    @recipe.name = @recipe.name.downcase
    @recipe.cook_time = ""
    @recipe.cook_temp = ""
    @recipe.temp_unit = ""

	  if @recipe.save
      @recipe.reload
	    #flash[:notice] = "recipe created!"
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

  def create_ingredient
    @user = User.find_by_id(params[:user_id])
    @recipe = @user.recipes.find(params[:id])

    ingredient = Ingredient.create({:name => @recipe.name, :image => @recipe.image, :tag_name => "multi-recipe", :user_id => @user.id, :recipe_id => @recipe.id})
    ingredient.reload
    @recipe.has_ingredient = ingredient.id
    @recipe.build_tag_list
    @recipe.save

    respond_to do |format|
      format.js
    end
  end

  def remove_ingredient
    @user = User.find_by_id(params[:user_id])
    @recipe = Recipe.find(params[:id])

    ingredient = Ingredient.find(@recipe.has_ingredient)
    ingredient.destroy
    @recipe.has_ingredient = nil
    @recipe.build_tag_list
    @recipe.save

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
