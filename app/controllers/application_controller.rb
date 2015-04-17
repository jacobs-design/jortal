class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery
  after_filter :verify_authorized

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def current_user
    User.where(uid: session[:cas_user]).first
  end

  def is_user?
    current_user
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || projects_url)
  end
end
