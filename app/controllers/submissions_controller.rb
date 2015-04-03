class SubmissionsController < ApplicationController
  before_filter CASClient::Frameworks::Rails::Filter
  before_filter :check_user!, except: [:new, :create, :thank_you]
  respond_to :html, :json

  # GET /submissions
  # GET /submissions.json
  # GET /submissions/1
  # GET /submissions/1.json
  def show
    @submission = Submission.find(params[:id])

    respond_with @submission
  end

  # GET /submissions/new
  # GET /submissions/new.json
  def new
    @submission = Submission.new

    respond_with @submission
  end

  # POST /submissions
  # POST /submissions.json
  def create
    @submission = Submission.new(params[:submission])

    respond_to do |format|
      if @submission.save
        redirect_to thank_you_path
        return
      else
        flash[:error] = "Missing requirement(s)"
        redirect_to submit_submission_projects_path
        # format.html { render action: "new" }
        # format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submissions/1
  # DELETE /submissions/1.json
  def destroy
    @submission = Submission.find(params[:id])
    @submission.destroy

    respond_with @submission
    respond_to do |format|
      format.html { redirect_to project_submissions_url }
      format.json { head :no_content }
    end
  end

  def thank_you
  end

  protected
  def find_project
    if params[:project_id]
      Project.find(params[:project_id])
    end
  end
  helper_method :find_project
end
