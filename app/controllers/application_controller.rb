class ApplicationController < ActionController::Base
  protect_from_forgery

  def is_user?
    User.where(uid: session[:cas_user]).first
  end

  def is_admin?
    user = User.where(uid: session[:cas_user]).first
    user and user.admin
  end

  def check_user!
    back = request.env["HTTP_REFERER"] || projects_url
    redirect_to back, notice: "You must be logged in to do that" unless is_user?
  end

  def check_admin!
    back = request.env["HTTP_REFERER"] || projects_url
    redirect_to back, notice: "You must be an admin to do that" unless is_admin?
  end
end
