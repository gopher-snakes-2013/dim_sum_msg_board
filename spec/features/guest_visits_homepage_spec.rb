require 'spec_helper'

feature "Guest visits homepage" do
  scenario "Homepage Exists" do
    visit '/'
    expect(page).to have_content "Here's our discussion board!"
  end
end

feature  "Guest can create discussion" do
  scenario "Creates Discussion" do
    visit '/'
    expect(page).to have_content "discussion 1"
  end
end



