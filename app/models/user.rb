# == Schema Information
#
# Table name: users
#
#  id                  :integer         not null, primary key
#  name                :string(255)
#  email               :string(255)
#  created_at          :datetime        not null
#  updated_at          :datetime        not null
#  password_digest     :string(255)
#  remember_token      :string(255)
#  admin               :boolean         default(FALSE)
#  avatar              :string(255)
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  farm_name           :string(255)
#  location            :string(255)
#  grown_produce       :string(255)
#  wanted_produce      :string(255)
#  description         :string(255)
#  contact_number      :integer
#  album_file_name     :string(255)
#  album_content_type  :string(255)
#  album_file_size     :string(255)
#  album_updated_at    :datetime
#  latitude            :float
#  longitude           :float
#  seller              :boolean
#

class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation, :avatar, :farm_name, :description, 
      :location, :location_state, :seller, :latitude, :longitude
  has_secure_password
  has_many :products, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name: "Relationship",
                                   dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  has_attached_file :avatar, :styles => { :thumb => "75x75>" },
                  :url  => "/assets/products/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

  #validates_attachment_presence :avatar
  
  validates_attachment_size :avatar, :less_than => 5.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']
  
  geocoded_by :address
  after_validation :geocode, :if => :location_changed?

  before_save { email.downcase! }
  before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true

has_many :reverse_relationships, foreign_key: "followed_id",
class_name: "Relationship",
dependent: :destroy
has_many :followers, through: :reverse_relationships, source: :follower

def address
[location, location_state].compact.join(', ')
end

def feed
Product.from_users_followed_by(self)
end

def following?(other_user)
relationships.find_by_followed_id(other_user.id)
end

def follow!(other_user)
relationships.create!(followed_id: other_user.id)
end

def following?(other_user)
relationships.find_by_followed_id(other_user.id)
end

def follow!(other_user)
relationships.create!(followed_id: other_user.id)
end

def unfollow!(other_user)
relationships.find_by_followed_id(other_user.id).destroy
end

private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end
