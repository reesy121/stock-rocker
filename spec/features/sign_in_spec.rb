require 'rails_helper'

describe "Signing in" do

  it "prompts for an email and password" do

  	visit root_url

  	click_link "Login"

  	expect(current_path).to eq(new_user_session_path)

  	expect(page).to have_field("Email")
  	expect(page).to have_field("Password")

  end

  it "valid combination signs in user" do
  	user = User.create!(user_attributes)

  	visit root_url

  	click_link "Login"

    sign_in(user)

  	expect(current_path).to eq(root_path)
    expect(page).to have_text("Signed in successfully")

    expect(page).to have_link("Your User")
    expect(page).to have_link("Logout")

    expect(page).not_to have_link('Sign In')
  end

  it "invalid combination does not sign in user" do
    visit root_url

    click_link "Login"

    fill_in "Email", with: "Wronger"
    fill_in "Password", with: "qwerty"

    click_button "Log In"

    expect(current_path).to eq(new_user_session_path)
    expect(page).to have_text("Invalid Email or password.")

    expect(page).not_to have_link("Your User")
    expect(page).not_to have_link("Logout")

    expect(page).to have_link('Login')
  end

  #it "redirects to the intended page" # Put in later?

end