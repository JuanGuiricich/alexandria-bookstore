class Api::BooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!
  before_action :set_book, only: %i[ show edit update destroy ]

  def index
    @books = Book.all
    @books = Book.filter_by_title(params[:title]) if params[:title].present?
    @books = Book.filter_by_author(params[:author]) if params[:author].present?
    @books = Book.filter_by_price_range(params[:min_price], params[:max_price]) if params[:min_price].present? && params[:max_price].present?
    @books = @books.page(params[:page]).per(params[:per_page] || 10)
    render json: @books
  end

  def show
    render json: @book
  end

  def create
    @book = Book.new(book_params)
    render json: @book, status: :created
  end

  def update
    @book.update(book_params)
    render json: @book
  end

  def destroy
    @book.destroy
    head :no_content
  end

  private

  def book_params
    params.require(:book).permit(:title, :isbn, :date_of_publication, :review, :price, :author_id, :publisher_id)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
