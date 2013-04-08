require 'spec_helper'

describe "oauth sessions" do
  before(:each) do
    OmniAuth.config.add_mock(:github, {info:        {nickname: 'Tester'},
                                       credentials: {token: 'abc123'}})
  end

  it "signs in with github" do
    visit root_path
    click_link 'Submit a task'
    page.should have_content "List a task"
  end
end
