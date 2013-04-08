require 'spec_helper'

describe "oauth sessions" do
  it "signs in with github" do
    OmniAuth.config.add_mock(:github, {info:        {nickname: 'Tester'},
                                       credentials: {token: 'abc123'}})

    visit root_path
    click_link 'Submit a task'
    page.should have_content "List a task"
  end

  it "displays a failure message when authentication fails" do
    OmniAuth.config.mock_auth[:github] = :invalid_credentials

    visit root_path
    click_link 'Submit a task'
    page.should have_content "Authentication with GitHub failed: Invalid credentials"
  end
end
