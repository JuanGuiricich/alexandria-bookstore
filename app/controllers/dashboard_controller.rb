class DashboardController < ApplicationController
  before_action :authorize_admin
  before_action :set_book, only: [:show, :edit, :update, :destroy]


  def dashboard
  end

  def books
    if params[:query].present?
      @books = Book.search_by_title_and_author_and_publisher(params[:query])
    else
      @books = Book.all
    end
  end

  def update_book_prices
    publisher_id = params[:book_price_update][:publisher_id].to_i
    action = params[:book_price_update][:action]
    percentage = params[:book_price_update][:percentage].to_f

    PriceUpdateJob.perform_later(publisher_id, action, percentage)

    flash[:notice] = 'Book price has been updated.'
    redirect_to dashboard_path
  end
end
