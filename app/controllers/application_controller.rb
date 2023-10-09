class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  def authorize_admin
    unless current_user&.admin?
      redirect_to root_path, alert: 'You are not authorized to access this page.'
    end
  end
end
