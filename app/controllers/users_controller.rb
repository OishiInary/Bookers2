class UsersController < ApplicationController
  
  
  def index
    @users = User.all
  end 
    
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
      if @book.save
         flash[:notice] = "You have created book successfully."
         redirect_to book_path(@book.id)
      else 
        @books = Book.all
        render template: "books/index"
      end
  end
  
  def edit
    @user = current_user
  end  
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
     redirect_to user_path(@user.id)
    else
      render :index
      
    end
  end
  
private
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
end
