class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :add_to_favorites]
  before_action :authorize_admin, except: [:index, :favorites, :add_to_favorites, :remove_favorites ]
  before_action :set_book, only: [:show, :edit, :update, :destroy, :add_to_favorites, :remove_favorites]

  def index
    if params[:query].present?
      @books = Book.search_by_title_and_author_and_publisher(params[:query])
    else
      @books = Book.all
    end
    @books = @books.page(params[:page]).per(10)
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

  def add_to_favorites
    current_user.favorite(@book) if user_signed_in?
    redirect_to favorites_books_path
  end

  def remove_favorites
    current_user.unfavorite(@book) if user_signed_in?
    redirect_to favorites_books_path
  end

  def favorites
    @favorite_books = current_user.all_favorited
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :isbn, :date_of_publication, :review, :price, :author_id, :publisher_id)
  end
end
