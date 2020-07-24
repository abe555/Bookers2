class UsersController < User::ApplicationController


	def show
		@user = User.find(params[:id])
		@book = @user.books
	end

	def edit
		@user = User.find(params[:id])
		if current_user == @user
			flash[:notice] = "Profile was successfully updated!"
			@user = User.find(params[:id])
		else
			flash[:notice] = "error!"
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
