class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :authorize_admin, except: [:index]
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @books = Book.search_by_title_and_author_and_publisher(params[:query])
    else
      @books = Book.all
    end
    respond_to do |format|
      format.html
      format.text { render partial: 'list', locals: { books: @books }, formats: [:html] }
    end
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.save!
    redirect_to dashboard_books_path
  end

  def show
  end

  def edit
  end

  def update
    @book.update(book_params)
    redirect_to dashboard_books_path
  end

  def destroy
    @book.destroy
    redirect_to dashboard_books_path
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :isbn, :date_of_publication, :review, :price, :author_id, :publisher_id)
  end
end
