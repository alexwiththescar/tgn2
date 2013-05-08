ThinkingSphinx::Index.define :product, :with => :active_record, :delta => true do
  indexes content, :sortable => true
  has "RADIANS(lat)",  :as => :latitude,  :type => :float
  has "RADIANS(lon)", :as => :longitude, :type => :float  

  
end
