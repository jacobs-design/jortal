require 'spec_helper'

describe SubmissionsController do
    describe 'show submissions' do
        before :each do
            Project.create(name: "CS169", desc: "saasbook")
            Submission.create(title: "swoject", desc: "super swole project", attachment: "blah", project_id: 1)
        end

        it 'should show all submissions for this project' do
            visit 'projects/1/submissions'
            expect(page).to have_content 'swoject'
        end
    end
end
