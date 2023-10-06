class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

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
end
