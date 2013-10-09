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

    fill_in "discussion_title", with: "let's talk about dimsum again"
    fill_in "discussion_body", with: "hello"

    click_on "Create Discussion"

    expect(page).to have_content("let's talk about dimsum again")
  end
end

feature "Guest can click on discussion links" do 
  scenario "Click Discussion" do
    visit '/'

    click_on "discussion.title"

    expect(page).to have_content "meow meow meow"
  end
end
