require 'spec_helper'

feature "Guest visits homepage" do
  scenario "Homepage Exists" do
    visit '/'
    expect(page).to have_content "Here's our discussion board!"
  end
end




