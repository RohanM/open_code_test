require 'spec_helper'

describe "landing page" do
  it "welcomes employers and open source projects" do
    visit root_path
    page.should have_content "Employers"
    page.should have_content "Open Source Projects"
  end
end
