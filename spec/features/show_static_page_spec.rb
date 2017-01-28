require 'rails_helper'

describe "Show static page" do

	it "about shows the name in the title" do
		visit root_url

		click_link 'About'

		expect(page).to have_title("About | Stock Rocker Blog")
	end

	it "contact us shows the name in the title" do
		visit root_url

		click_link 'Contact'

		expect(page).to have_title("Contact | Stock Rocker Blog")
	end



end