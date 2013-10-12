require 'spec_helper'

feature "Guest visits homepage" do
  scenario "Homepage Exists" do
    visit '/'
    expect(page).to have_content "Here's our discussion board!"
  end
end

feature  "Guest can create discussion" do
  scenario "Create User" do
    visit '/'
      fill_in "new_username", with: "salarsucks"
      fill_in "new_password", with: "password"
      click_on "Create User"
    end

  scenario "Creates Discussion" do
    visit '/'


    fill_in "discussion_title", with: "let's talk about dimsum again"
    fill_in "discussion_body", with: "hello"
    fill_in "username", with: "salarsucks"
    fill_in "password", with: "password"

    click_on "Create Discussion"

    expect(page).to have_content("let's talk about dimsum again")
  end

   scenario "Click Discussion" do
    visit '/discussion/:id'

    expect(page).to have_content "hello"
  end

  scenario "Search" do
   visit '/'
    fill_in "search_text", with: "let's talk about dimsum again"

    click_on "Find Sumthing!"

    expect(page).to have_content ("let's talk about dimsum again")
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


feature "Does Search Route Work" do
  scenario "Search" do
    visit '/'
      fill_in "search_text", with: "derp"

      click_on "Find Sumthing!"

      expect(page).to have_content ("Here are those things you wanted")
  end
end


