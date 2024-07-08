class BooksController < ApplicationController
  def new
    @books = Book.new
  end
  
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(book_params[:id])
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
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
