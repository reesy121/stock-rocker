class Song < ActiveRecord::Base

	has_attached_file :audio
	validates_attachment :audio, presence: true, 
						content_type: { content_type: ['audio/mp3','audio/mpeg'] },
						less_than: 15.megabytes
	validates :artist, presence: true
	validates :title, presence: true #, uniqueness: { scope: :artist,
    #message: "only one song with the same name per artist" }

end
