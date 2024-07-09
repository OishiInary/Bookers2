class BooksController < ApplicationController
   def new
    @book = Book.new
  end
  
  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
      if @book.save
      redirect_to book_path(book.id)
     
     else
     render books_path
     end
  end
  
  def destroy
    book =Book.find(book_params[:id])
    book.destroy
    redirect_to books_path
  end
  
 
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
