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

   scenario "Click Discussion" do
    visit '/discussion/:id'

    expect(page).to have_content "hello"
  end
end


feature  "Guest can create posts" do
  scenario "Creates Discussion" do
    visit '/discussion/1'

    fill_in "discussion_post", with: "taytay all day"

    click_on "comment"

    expect(page).to have_content("taytay all day")
  end
end
