class Vote < ActiveRecord::Base
  attr_accessible :city_id, :email, :other
  belongs_to :city

  validates :email, :format => { :with => %r{.+@.+\..+} }, :allow_blank => false 

  validates_uniqueness_of :city_id, :scope => :email
  validates_uniqueness_of :other, :scope => :email
  
end
