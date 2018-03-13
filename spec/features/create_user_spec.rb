require 'rails_helper'

describe "Creating a user" do

  it "with valid details saves and loads root" do

  	visit root_url

  	click_link "Login"
  	click_link "Or Sign up"

  	fill_in "First name", with: "Ruby"
  	fill_in "Last name", with: "Roland"
  	fill_in "Email", with: "rubyroland@rails.com"
  	fill_in "Password", with: "12345678", match: :prefer_exact
  	fill_in "Password confirmation", with: "12345678", match: :prefer_exact

  	click_button "Sign up"

    expect(page).to have_text("Welcome! You have signed up successfully.")
    expect(page).to have_text("Logout")
    expect(page).to have_text("Your User")
    expect(page).to have_text("Blogs")
    expect(page).not_to have_text("Login")
    expect(page).not_to have_text("Categories")
    expect(page).not_to have_text("Contact")
    expect(page).not_to have_text("Songs") #admin user only


  end

  it "does not save the user if it's invalid" do
    visit root_url

    click_link 'Login'

    click_link 'Or Sign up'

    fill_in "First name", with: ""
    fill_in "Last name", with: "Roland"
    fill_in "Email", with: "rubyroland@rails.com"
    fill_in "Password", with: "12345678", match: :prefer_exact
    fill_in "Password confirmation", with: "12345678", match: :prefer_exact

    expect {
      click_button 'Sign up'
    }.not_to change(User, :count)

    expect(page).to have_text("Please review the problems below:")
    expect(page).to have_text("First name" + "can't be blank")
  end

end