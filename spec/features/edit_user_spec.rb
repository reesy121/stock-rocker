require 'rails_helper'

describe "Editing a user" do

	it "updates the user with valid attributes and shows the new details" do
		user = User.create!(user_attributes)

		sign_in(user)

		click_link 'Your User'

		expect(current_path).to eq(edit_user_registration_path)
		expect(find_field('First name').value).to eq(user.first_name)

		fill_in "First name", with: "Changed me"
		fill_in "Current password", with: user.password

		click_button 'Update'

		expect(current_path).to eq(edit_user_registration_path)
		expect(find_field('First name').value).to eq("Changed me")
		expect(page).to have_text("Your account has been updated successfully.")
	end

	it "doesn't update the user with invalid attributes" do
		user = User.create!(user_attributes)

		sign_in(user)

		click_link 'Your User'

		fill_in "First name", with: ""

		click_button 'Update'

		expect(page).to have_text("Please review the problems below:")
		expect(page).to have_text("can't be blank")
	end

end