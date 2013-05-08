class Photo < ActiveRecord::Base
  attr_accessible :product_id
  belongs_to :product
  has_attached_file :data 
end
# == Schema Information
#
# Table name: photos
#
#  id                :integer         not null, primary key
#  product_id        :integer
#  created_at        :datetime        not null
#  updated_at        :datetime        not null
#  data_file_name    :string(255)
#  data_content_type :string(255)
#  data_file_size    :integer
#  data_updated_at   :datetime
#

