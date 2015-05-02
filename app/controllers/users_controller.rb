class UsersController < ApplicationController
  before_filter CASClient::Frameworks::Rails::Filter
  after_filter :verify_authorized

  rescue_from Pundit::NotAuthorizedError, ActiveRecord::RecordNotFound, with: :redirect_to_submit_submission

  respond_to :html, :json

  # GET /users
  def index
    authorize User

    @users = User.all
    @who = session[:cas_user]

    respond_with @users
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  # POST /users
  def create
    @user = User.new(params[:user])
    authorize @user

    if @user.save
      flash[:notice] = 'User was successfully created.'
    else
      if @user.errors.full_messages.include?("Uid has already been taken")
        flash[:notice] = "Error: UID has already been taken."
      elsif @user.errors.full_messages.include?("Uid can't be blank")
        flash[:notice] = "Error: UID cannot be blank."
      else
        flash[:notice] = @user.errors.full_messages.to_s
      end
    end
    
    redirect_to users_url
  end

  # PUT /users/1
  def update
    @user = User.find(params[:id])
    authorize @user

    if @user.update_attributes(params[:user])
      flash[:notice] = 'User was successfully updated.'
    else
      flash[:notice] = 'User was not successfully updated.'
    end
    # respond_with @user
    redirect_to users_url
  end

  # DELETE /users/1
  def destroy
    @user = User.find(params[:id])
    authorize @user

    if @user.destroy
      flash[:notice] = 'User was successfully deleted. Good riddance.'
    else
      flash[:notice] = 'User was not successfully deleted.'
    end
    respond_with @user
  end

  # GET /users/1/projects
  def projects
    @user = User.find(params[:id])
    authorize @user

    @projects = @user.projects
  end
end

def redirect_to_submit_submission
  if current_user and not current_user.admin
    puts current_user.admin
    flash[:warning] = "You are not authorized to access this page."
    redirect_to projects_url
  else
     redirect_to submit_submission_projects_url
  end
end
