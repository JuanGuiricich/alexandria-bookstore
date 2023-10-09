class DashboardController < ApplicationController
  before_action :authorize_admin
  before_action :set_book, only: [:show, :edit, :update, :destroy]


  def dashboard
  end

  def books
    @books = Book.all
  end
end
