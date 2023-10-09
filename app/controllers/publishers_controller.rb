class PublishersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin
  before_action :set_publisher, only: [:show, :edit, :update, :destroy]

  def new
    @publisher = Publisher.new
  end

  def create
    @publisher = Publisher.new(publisher_params)
    @publisher.save
    redirect_to publishers_path
  end

  def show
    @book_count = Book.where(publisher_id: @publisher.id).count
  end

  def index
    @publishers = Publisher.all
  end

  def edit
  end

  def update
    @publisher.update(publisher_params)
    redirect_to publishers_path
  end

  def destroy
    @publisher.destroy
    redirect_to publishers_path
  end

  private

  def set_publisher
    @publisher = Publisher.find(params[:id])
  end

  def publisher_params
    params.require(:publisher).permit(:name)
  end
end
