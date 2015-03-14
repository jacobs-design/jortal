require 'spec_helper'

describe SubmissionsController do
    before :each do
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
end
