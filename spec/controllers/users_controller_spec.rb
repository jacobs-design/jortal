require 'spec_helper'

describe UsersController do
    before :each do
        @admin = User.create(name: "Arlan Yaska", email: "ayaaska@best.com", uid: 1337, admin: true)
        @user = User.create(name: "bk randy", email: "ng@example.com", uid: 13, admin: false)
        CASClient::Frameworks::Rails::Filter.fake("1337")
    end

    describe 'list users' do
        it 'should list all of the users' do
            get :index 
            response.should render_template :index
        end
    end

    describe 'show a user' do
        it 'should show the user' do
            CASClient::Frameworks::Rails::Filter.fake("13")
            get :show, :id => @user.id
            response.body.should render_template :show
        end
    end
end
