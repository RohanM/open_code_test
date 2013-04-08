require 'spec_helper'

describe SessionsController do
  describe "signing in with github" do
    context "when the user already exists" do
      before(:each) do
        @user = User.create! nickname: 'Tester', oauth_token: 'zzz'
        OmniAuth.config.add_mock(:github, {info:        {nickname: 'Tester'},
                                           credentials: {token: 'abc123'}})
        request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:github]

        get :create
      end

      it "updates the user's oauth token" do
        @user.reload.oauth_token.should == 'abc123'
      end

      it "signs the user in" do
        session[:user_id].should == @user.id
      end

      it "redirects to the new test page" do
        assert_redirected_to new_test_path
      end
    end

    context "when the user does not exist" do
      before(:each) do
        OmniAuth.config.add_mock(:github, {info:        {nickname: 'Tester'},
                                           credentials: {token: 'abc123'}})
        request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:github]

        User.where(nickname: 'Tester').should be_empty
      end

      it "creates a new user" do
        expect { get :create }.to change(User, :count).by(1)
        @user = User.where(nickname: 'Tester').first
        @user.oauth_token.should == 'abc123'
      end

      it "signs the user in" do
        get :create
        @user = User.where(nickname: 'Tester').first
        session[:user_id].should == @user.id
      end

      it "redirects to the new test page" do
        get :create
        assert_redirected_to new_test_path
      end
    end
  end
end
