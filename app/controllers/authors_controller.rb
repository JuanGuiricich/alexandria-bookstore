class AuthorsController < ApplicationController
  before_action :authorize_admin
  before_action :set_author, only: %i[ show edit update destroy ]

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    @author.save
    redirect_to authors_path
  end

  def show
  end

  def index
    @authors = Author.all
    if params[:query].present?
      @authors = Author.search_author(params[:query])
    else
      @authors = Author.all
    end
    respond_to do |format|
      format.html
      format.text { render partial: 'list', locals: { authors: @authors }, formats: [:html] }
    end
  end

  def edit
  end

  def update
    @author.update(author_params)
    redirect_to authors_path
  end

  def destroy
    @author.destroy
    redirect_to authors_path
  end

  private

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:first_name, :last_name, :date_of_birth, :about, :nationality)
  end
end
