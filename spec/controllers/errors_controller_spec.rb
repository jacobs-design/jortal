require 'spec_helper'

describe ErrorsController do
    render_views
    before :each do
        @user = User.create(name: "Jack", email: "jackiscool@berkeley.edu", uid: 991334, admin: false)
        CASClient::Frameworks::Rails::Filter.fake("991334")
        @project = Project.create(name: "CS169", desc: "saasbook")
        @project.users = [@user]
        @submission = Submission.create(name: "submittier", title: "swoject", desc: "super swole project", attachment: File.new(Rails.root + 'spec/fixtures/files/tester.txt'), project_id: @project.id)
    end

    describe 'display 404' do
        it 'should show the 404 form' do
            visit '/oeirjlsdkfjs'
            page.should have_content('404')
        end
    end
end
