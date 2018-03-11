require 'rails_helper'

describe "Deleting a song" do

	before do
      @user = User.create!(user_attributes(admin: true))
      sign_in(@user)
    end

	it "destroys the songs and removes the listing" do
	  song = Song.create!(song_attributes)
	  visit songs_path

	  click_on 'Delete'
	  expect(current_path).to eq(songs_path)
	  expect(page).not_to have_text(song.title)
	  expect(page).to have_text("Song was successfully deleted")
	end

end