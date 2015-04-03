require 'spec_helper'

describe ProjectsController do
  render_views
  before :each do
    @user = User.create(name: "Kenneth", email: "kennethiscool@berkeley.edu", uid: 994946, admin: true)
    @not_user = User.create(name: "Jack", email: "jackiscool@berkeley.edu", uid: 991334, admin: false)
    CASClient::Frameworks::Rails::Filter.fake('994946')
    @project1 = Project.create(name: 'CS 169', desc: 'Rails app development')
    @submission1_1 = Submission.create(
      title: 'submission test',
      desc: 'test submission desc',
      attachment: File.new(Rails.root + 'spec/fixtures/files/tester.txt'),
      project_id: @project1.id,
      like: false)
    @project2 = Project.create(name: 'CS 186', desc: 'Apache Spark business')
  end
  describe 'GET #index' do
    it 'renders the index template with get' do
      get :index
      expect(response).to render_template('index')
    end
    it 'renders the index template at /' do
      visit '/'
      expect(response).to render_template('index')
    end
    it 'renders the index template at /projects' do
      visit '/projects'
      expect(response).to render_template('index')
    end
  end
  describe 'POST #create' do
    context 'all required fields provided' do
      it 'redirects to the newly created project page' do
        post :create, :project => {name: 'CS 169', desc: 'Rails app dev'}
        expect(response).to redirect_to project_path(Project.last)
      end
    end
    context 'some required field(s) missing' do
      it 'renders the new project template' do
        post :create, :project => {name: "missing description"}
        expect(response).to render_template('new')
      end
    end
  end
  describe 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template('new')
    end
  end
#  describe 'GET #edit' do
#    it 'renders the edit template' do
#      get :edit
#      expect(response).to render_template('edit')
#    end
#  end
  describe 'GET #show' do
    context 'authenticated and a user' do
      it 'shows the list of associated submissions' do
        get :show, :id => @project1.id
        expect(response).to render_template('show')
      end
    end
    context 'authentiated and NOT a user' do
      it 'redirects to the new project submission page' do
        CASClient::Frameworks::Rails::Filter.fake('1337')
        get :show, :id => @project1.id
        expect(response).to redirect_to new_project_submission_url(@project1)
      end
    end
  end
  describe 'POST #show' do
    it 'likes a project' do
      post :show, :id => @project1, :likes => ['1_1']
      expect(response).to render_template('show')
    end
  end
#  describe 'PUT #update' do
#  end
  describe 'DELETE #destroy' do
    it 'destroys a project' do
      post :destroy, :id => @project1
      expect(response).to redirect_to(projects_path)
    end
  end
end
