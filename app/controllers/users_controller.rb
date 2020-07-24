class UsersController < ApplicationController

	before_action :authenticate_user!

	def show
		@user = User.find(params[:id])
		@book = @user.books
	end

	def edit
		if @user_id == current_user.id
			@user = User.find(params[:id])
		else
			redirect_to user_path(current_user.id)
		end
	end

	def update
		user = User.find(params[:id])
		user.update(user_params)
		redirect_to user_path(user.id)
	end

	def index
		@users = User.all
		@user = current_user
	end

	def destroy
	end

	private
	def user_params
		params.require(:user).permit(:name, :introduction, :profile_image)
	end

end
