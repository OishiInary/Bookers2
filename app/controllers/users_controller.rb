class UsersController < ApplicationController
  
  
  def index
    @users = User.all
    @user = current_user
    @book_new = Book.new
  end 
    
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book_new = Book.new
  end

  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
      if @book.save
         flash[:notice] = "You have created book successfully."
         redirect_to book_path(@book.id)
      else 
        @books = Book.all
        flash.now[:denger] = "error"
        render template: "books/index"
      end
  end
  
  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user.id)
    end  
  end  
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "successfully"
     redirect_to user_path(@user.id)
    else
      flash.now[:denger] = "error"
      render :edit
      
    end
  end
  
private
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
end
