require 'rails_helper'

describe "Deleting a user" do

	it "successfully destroys user and logs them out" do
		user = User.create!(user_attributes)

		visit root_url

		sign_in(user)

		click_link 'Your User'

		click_link 'Cancel my account'

		expect(current_path).to eq(root_path)
		expect(page).to have_text("Bye! Your account has been successfully cancelled. We hope to see you again soon.")
		expect(page).to have_text("Login")
		expect(page).not_to have_text("Your user")
	end

end