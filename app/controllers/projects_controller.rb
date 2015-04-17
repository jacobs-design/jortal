class ProjectsController < ApplicationController
  before_filter CASClient::Frameworks::Rails::Filter
  after_filter :verify_authorized, :except => [:submit_submission]
  respond_to :html, :json

  rescue_from Pundit::NotAuthorizedError, with: :redirect_to_submit_submission

  # GET /projects
  def index
    @projects = Project.all
    authorize Project
    @user = current_user

    respond_with @projects
  end

  # GET /projects/1
  def show
    @project = Project.find(params[:id])
    authorize @project

    @submissions = Submission.where(:project_id => @project.id)
    respond_with @project
  end

  # GET /projects/new
  def new
    @project = Project.new
    authorize @project

    respond_with @project
  end

  # POST /projects
  def create
    @project = Project.new(params[:project])
    authorize @project

    flash[:notice] = 'Project was successfully created.' if @project.save
    respond_with @project
  end

  # DELETE /projects/1
  def destroy
    @project = Project.find(params[:id])
    authorize @project

    @project.destroy

    respond_with @project
  end

  def submit_submission
    @projects = Project.all

    respond_with @projects
  end

  def redirect_to_submit_submission
    redirect_to submit_submission_projects_url
  end

end

