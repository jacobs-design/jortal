class ErrorsController < ApplicationController
  before_filter CASClient::Frameworks::Rails::Filter
  after_filter :verify_authorized, :except => [:error_404, :error_500]
  respond_to :html, :json
  def error_404
    @not_found_path = params[:not_found]
  end

  def error_500
  end
end
