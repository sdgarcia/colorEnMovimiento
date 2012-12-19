class Vote < ActiveRecord::Base
  attr_accessible :city_id, :email, :other
  belongs_to :city

  validates :email, :format => { :with => %r{.+@.+\..+} }, :allow_blank => false 


end
