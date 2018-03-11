require 'rails_helper'


describe "Creating a new song" do

  before do
	@user = User.create!(user_attributes(admin: true))
	sign_in(@user)
  end

  it "with valid details saves and loads the song" do
  	visit songs_path
	expect(current_path).to eq(songs_path)
	fill_in "Title", with: "Test Title!"
	fill_in "Artist", with: "Test Artist"
	attach_file "Audio", "spec/support/fixtures/2mb.mp3"

	click_on "Upload"

	expect(current_path).to eq(songs_path)
	expect(page).to have_text("Thanks, song has been uploaded")
	expect(page).to have_text("Test Title!")
	expect(page).to have_text("Test Artist")
	expect(page).to have_selector("audio")
  end

  it "with invalid details doesn't save" do
	visit songs_path

    expect { 
      click_on 'Upload' 
    }.not_to change(Song, :count)
    
    expect(current_path).to eq(songs_path)   
    expect(page).to have_text('error')
  end



end