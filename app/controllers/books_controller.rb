class BooksController < ApplicationController
   def new
    @book_new = Book.new
   end
  
  def index
    @books = Book.all
    @book_new = Book.new
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    
    @book_new = Book.new
  end
  
  def create
    @book_new = Book.new(book_params)
    @book_new.user_id = current_user.id
      if @book_new.save
         flash[:notice] = "You have created book successfully."
         redirect_to book_path(@book_id.id)
      else 
        @books = Book.all
        @user = current_user
        flash.now[:denger] = "error"
        render :index
      end
  end
  
  def edit
    @book = Book.find(params[:id])
     if @book.user != current_user
      redirect_to books_path
     end  
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success] = "successfully"
     redirect_to book_path(@book.id)
    else
       flash.now[:denger] = "error"
      render :edit
    end  
  end
  
  def destroy
    book =Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
 
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
