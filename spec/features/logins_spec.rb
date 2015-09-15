require 'rails_helper'
require 'pry'

RSpec.feature "Logins", type: :feature do
  scenario "User should be able to login" do


    # User.destroy_all

    User.create({email: 'new@gmail.com',username: 'new', password: "password"})

    visit root_path

    click_link "Login"

    fill_in "email", with: "new@gmail.com"
    fill_in "password", with: "password"
    # binding.pry;

    click_button "Login"
    expect(page).to have_content("Welcome")

    click_link "new"

    expect(page).to have_content("Logout")

  end
end
