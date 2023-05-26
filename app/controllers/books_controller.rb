class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :move_to_index,      only:   [:edit, :update, :destroy]
  
  

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
    @comment = Comment.new
    @comments = @book.comments
  end

  def edit
    @book = Book.find(params[:id])   
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to action: 'show'
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to action: 'index'
  end

  private
  def book_params
    params.require(:book).permit(:image, :category_id, :title, :author, :description).merge(user_id: current_user.id)
  end

  def move_to_index
    @book = Book.find(params[:id])
    if @book.user_id != current_user.id
      redirect_to action: :index
    end    
  end
end
