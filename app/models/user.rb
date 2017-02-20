class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :blogs, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :first_name, :last_name, presence: true 
  validates :password, length: { minimum: 8, allow_blank: true  }

  scope :all_except, ->(user) { where.not(id: user) }

  def full_name
  	first_name + ' ' + last_name
  end

end
