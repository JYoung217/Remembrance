require "rails_helper"

feature "the homepage" do
  scenario "a user should get the home page" do
    visit root_path
    expect(page).to have_content("Memorials")
  end

  scenario "a user can sign up with Facebook" do
  end

  scenario "a user can log in with Facebook" do
  end

  scenario "a user can sign up with an email address" do
  end

  scenario "a user can log in with an email address" do
  end

  scenario "a user can view the content on the first page" do
  end

  scenario "a user can view the CONTACT US tab" do
  end

  scenario "a user can view the ABOUT THIS PROJECT tab" do
  end
end