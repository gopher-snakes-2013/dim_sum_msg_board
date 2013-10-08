require 'spec_helper'

feature "Guest visits homepage" do
  scenario "Homepage Exists" do
    visit '/'
    expect(page).to have_content "Hello world"
  end
end




