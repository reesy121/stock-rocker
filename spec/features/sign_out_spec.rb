require 'rails_helper'

describe "Signing out" do

 it "Signs user out successfully" do

 	user = User.create!(user_attributes)

  	visit root_url

  	click_link "Login"

    sign_in(user)

    click_link "Logout"

    expect(page).to have_text("Signed out successfully")
    expect(page).not_to have_link('Logout')
    expect(page).to have_link('Login')

 end


end