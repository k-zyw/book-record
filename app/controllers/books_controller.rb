class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to action: 'index'
    else
      @book = Book.new(book_params)
      render :new
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  private
  def book_params
    params.require(:book).permit(:image, :category_id, :title, :author, :description).merge(user_id: current_user.id)
  end
end
