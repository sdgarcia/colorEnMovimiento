class AdminController < ApplicationController
  before_filter :admin_required
  layout 'admin'	
  def home
    @total_votes = Vote.count
    @votes_other = Vote.where(" city_id <>6 AND other <> 'N/A'").count + Vote.where("city_id =6").count
    @votes = Vote.count(:group => 'city_id')
  end
end