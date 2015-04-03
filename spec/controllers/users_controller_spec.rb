require 'spec_helper'

describe UsersController do
    render_views
    before :each do
        @admin = User.create(name: "Arlan Yaska", email: "ayaaska@best.com", uid: 1337, admin: true)
        @user = User.create(name: "bk randy", email: "ng@example.com", uid: 13, admin: false)
        CASClient::Frameworks::Rails::Filter.fake("1337")
    end

    describe 'list users' do
        it 'should list all of the users' do
            get :index 
            response.should render_template :index
            expect(response.body).to include("Arlan Yaska")
        end
    end

    describe 'edit a user' do
        it 'should change the user' do
            CASClient::Frameworks::Rails::Filter.fake("1337")
            get :edit, :id => @user.id
            response.should render_template :edit
            post :update, :id => @user.id, :user => {:name => "bk randy", :email => "ng2@email.com", :uid => 13, :admin => false}

            get :index
            expect(response.body).to include("ng2@email.com")
        end
        it 'should fail if given a bad uid' do
            CASClient::Frameworks::Rails::Filter.fake("1337")
            post :update, :id => @user.id, :user => {:name => "bk randy", :email => "ng2@email.com", :uid => 1337, :admin => false}

            get :index
            expect(response.body).to include("not successfully updated")
        end
    end

    describe 'add a user' do
        it 'should add the user' do
            CASClient::Frameworks::Rails::Filter.fake("1337")
            get :index
            response.should render_template :index
            post :create, :user => {:name => "name person32", :email => "email@email.com", :uid => 12, :admin => false}

            get :index
            expect(response.body).to include("name person32")
        end

        it 'should fail if the uid already exists' do
            CASClient::Frameworks::Rails::Filter.fake("1337")
            post :create, :user => {:name => "name person32", :email => "email@email.com", :uid => 13, :admin => false}
            get :index
            expect(response.body).to include("UID has already been taken")
        end

        it 'should fail given a blank uid' do
            CASClient::Frameworks::Rails::Filter.fake("1337")
            post :create, :user => {:name => "name person32", :email => "email@email.com", :admin => false}
            get :index
            expect(response.body).to include("UID cannot be blank")
        end

        it 'should fail given a empty name' do
            CASClient::Frameworks::Rails::Filter.fake("1337")
            post :create, :user => {:uid => 12, :email => "email@email.com", :admin => false}
            get :index
            expect(response.body).to include("Name can't be blank")
        end
    end

    describe 'delete a user' do
        it 'should remove the user' do
            CASClient::Frameworks::Rails::Filter.fake("1337")
            post :destroy, :id => @user.id

            get :index
            expect(response.body).not_to include("bk randy")
        end
        it 'should show an error if the user can\'t be deleted' do
            CASClient::Frameworks::Rails::Filter.fake("1337")
            User.any_instance.should_receive(:destroy).and_return(false)
            post :destroy, :id => @user.id

            get :index
            expect(response.body).to include("not successfully deleted")
        end
    end
end
