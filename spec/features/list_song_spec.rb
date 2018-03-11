require 'rails_helper'

describe 'Viewing the list of songs' do

	it "shows the songs and some details" do
		user = User.create!(user_attributes(admin: true))
		song = Song.create!(song_attributes)
		category = Category.create!(category_attributes)
		blog = Blog.create!(blog_attributes(user_id: user.id, 
				categorizations_attributes: {"0"=>{"category_id"=> category.id, "_destroy"=>"false"} }))
		sign_in(user)
		
		visit songs_path

		expect(page).to have_text(song.title)
		expect(page).to have_text(song.artist)
		expect(page).to have_selector("audio")
		expect(page).to have_text("Delete")

		#Songs are also displayed on the blog path
		visit blog_path(blog)
		expect(current_path).to eq(blog_path(Blog.last))
		expect(page).to have_text(song.title)
		expect(page).to have_text(song.artist)
		expect(page).to have_selector("audio")
		expect(page).to have_text("Delete")
	end  
end