class BooksController < ApplicationController
  before_action :require_user, except: [:index]

  def index
    if params[:search]
      @response = Book.search(params[:search])
    end
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book
      # notice: "You sucessfuly added your title to the database." I don't know why this gives me a syntax error!!!!!!
    else
      render new_book_path
    end
  end

  def show
  end

  def edit
  end

  def destroy
  end

  def update
  end

  private

    def book_params
      params.require(:book).permit(:title, :author, :status)
    end

end
