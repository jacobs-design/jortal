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

end
