class Contact #< ActiveRecord::Base 
  #Only for sending emails

  include ActiveModel::Model
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :name, :message, :email

	validates :name, presence: true, length: { maximum: 50 }
	validates :message, presence: true, length: { maximum: 255 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 120 },
						format: { with: VALID_EMAIL_REGEX }
end
