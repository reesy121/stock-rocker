require 'rails_helper'

RSpec.describe Song, type: :model do

	context "presence of model attributes" do
	  before do
        @song = Song.new({artist: "", title: "", audio: ""})
  	  end

  	  it "artist must be present" do
	    @song.valid?  # populates errors

	  	expect(@song.errors[:artist].any?).to eq(true)
	  end

	  it "title must be present" do
	    @song.valid?  # populates errors

	  	expect(@song.errors[:title].any?).to eq(true)
	  end

	  it "audio must be present" do
	    @song.valid?  # populates errors

	  	expect(@song.errors[:audio].any?).to eq(true)
	  end
	end

 context "valid song attributes" do
  	it "to be valid" do
  		@song = Song.new(song_attributes)
	    expect(@song.valid?).to eq(true)
	end
  end

 context "paperclip validations" do
 	it "non mp3 files not valid" do
  		@song = Song.new(song_attributes({},"#{Rails.root}/spec/support/fixtures/download.png"))
	    @song.valid?
	    expect(@song.errors[:audio].any?).to eq(true)
 	end
 end

end
