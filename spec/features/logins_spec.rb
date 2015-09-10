require 'rails_helper'

RSpec.feature "Logins", type: :feature do
  scenario "User should be able to login" do
    visit root_path

    click_link "Login"


    fill_in "email", with: "me@email.com"
    fill_in "password", with: "password"

    click_button "Login"

    expect(page).to have_content("Welcome")

    click_link "me"

    expect(page).to have_content("Logout")
    
  end
end
