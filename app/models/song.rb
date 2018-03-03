class Song < ActiveRecord::Base

	has_attached_file :audio
	validates_attachment_presence :audio
	validates_attachment_content_type :audio, :content_type => ['audio/mp3','audio/mpeg']
	validates :artist, presence: true
	validates :title, presence: true #, uniqueness: { scope: :artist,
    #message: "only one song with the same name per artist" }

end
