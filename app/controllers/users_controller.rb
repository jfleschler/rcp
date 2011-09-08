class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		if @user == current_user
			@recipes = @user.recipes.paginate(:page => params[:page], :per_page => 30)
		else
			@recipes = @user.recipes.public.paginate(:page => params[:page], :per_page => 30)
		end
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			sign_in @user
			redirect_to root_url, :notice => "user has been created!"
		else
			render "new"
		end
	end
end
