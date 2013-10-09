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
    fill_in "discussion_title", with: "let's talk about dimsum"

    click_on "Create Discussion"

    expect(page).to have_content "let's talk about dimsum"
  end
end
