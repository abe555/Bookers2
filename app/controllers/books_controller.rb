 class BooksController < ApplicationController

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		@books = Book.all
		if	current_user.id != @book.user_id
			redirect_to user_path(current_user.id)
		elsif @book.save
			flash[:notice] = "Book was successfully updated!"
			redirect_to books_path
		else
			flash[:notice] = "error!"
			render :index
		end
	end

	def index
		@books = Book.all
		@user = current_user
	end

	def show
		@book = Book.find(params[:id])
		@user = @book.user.id
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			flash[:notice] = "Book was successfully updated!"
			redirect_to book_path(@book.id)
		else
			flash[:notice] = "error!"
			render :edit
		end
	end

	def destroy
		book = Book.find(params[:id])
		book.destroy
		redirect_to books_path
	end

	private
	def book_params
		params.require(:book).permit(:title, :body, :user_id)
	end


end
