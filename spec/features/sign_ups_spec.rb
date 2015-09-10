require 'rails_helper'

RSpec.feature "SignUps", type: :feature do

  scenario "User should be able to SignUp" do
    visit sign_up_path
    fill_in "user[email]", with: "me@email.com"
    fill_in "user[username]", with: "me"
    fill_in "user[password]", with: "password"

    click_button "Sign in"

    expect(User.last.email).to eq("me@email.com")
    expect(User.last.username).to eq("me")
    expect(User.last.password).not_to eq("password")

  end
end
