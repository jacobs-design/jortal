require 'spec_helper'

describe SubmissionsController do
    describe 'show submissions' do
        before :each do
            Project.create(name: "CS169", desc: "saasbook")
            Submission.create(title: "swoject", desc: "super swole project", attachment: File.new(Rails.root + 'spec/fixtures/files/tester.txt'), project_id: 1)
        end

        it 'should show all submissions for this project' do
            get :index
            # expect(page).to have_content 'swoject'
        end
    end
end
