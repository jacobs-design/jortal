require 'spec_helper'

describe SubmissionsController do
    render_views
    before :each do
        @user = User.create(name: "Jack", email: "jackiscool@berkeley.edu", uid: 991334, admin: false)
        CASClient::Frameworks::Rails::Filter.fake("991334")
        @project = Project.create(name: "CS169", desc: "saasbook")
        @submission = Submission.create(title: "swoject", desc: "super swole project", attachment: File.new(Rails.root + 'spec/fixtures/files/tester.txt'), project_id: @project.id)
    end

    describe 'new submission' do
        it 'should show the new submission form for this project' do
            get :new, :project_id => @project.id
            expect(response).to be_success
        end
    end
    describe 'thank you page' do
        it 'should show the submission thank you page' do
            get :thank_you
            expect(response).to be_success
        end
    end

    describe 'show submission' do
        it 'should show the student submission' do
            get :show, :project_id => @project.id, :id => @submission.id
            expect(response.body).to have_content("super swole project")
        end
    end

    describe '#destroy' do
        it 'should destroy specified submission' do
            submission_id = "1234"
            submission = double('fake submission').as_null_object
            Submission.stub(:find).with(submission_id).and_return(submission)
            submission.should_receieve(:destroy)
            delete :destroy, :project_id => @project.id, :id => submission_id
        end
    end

    describe 'create submission successfully' do
        it 'should create submission with provided parameters' do
            submission = double('fake submission').as_null_object
            

            Submission.should_receive(:create)
            Submission.create
            post :create, :submission => {}, :project_id => @project.id
        end
    end

end
