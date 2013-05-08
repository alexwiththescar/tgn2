# == Schema Information
#
# Table name: products
#
#  id                 :integer         not null, primary key
#  content            :string(255)
#  user_id            :integer
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#  ammount            :decimal(, )
#  price              :decimal(, )
#  organic            :boolean
#  delivery           :boolean
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  pic_file_name      :string(255)
#  pic_content_type   :string(255)
#  pic_file_size      :integer
#  pic_updated_at     :datetime
#

class Product < ActiveRecord::Base
  attr_accessible :content, :price, :ammount, :organic, :delivery, :farm_name, :pic, :pic_file_name, :pic_content_type, :pic_file_size, :pic_updated_at,
  :location, :longtitude, :latitude
  has_attached_file :pic, :styles => 
        { :medium => "300x300>", :thumb => "150x150>" }
 
  belongs_to :user
  
has_attached_file :photo,
            :url  => "/assets/products/:id/:style/:basename.:extension",
            :path => "/assets/products/:id/:style/:basename.:extension"

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 50 }

 
  
  default_scope order: 'products.created_at DESC'

def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
          user_id: user.id)
  end
end
