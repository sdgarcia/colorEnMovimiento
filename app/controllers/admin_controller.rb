class AdminController < ApplicationController
  before_filter :admin_required
  layout 'admin'	
  def home
    @total_votes = Vote.count
    @votes_other = Vote.where(" city_id <>6 AND other <> 'N/A'").count + Vote.where("city_id =6").count
    @votes = Vote.count(:group => 'city_id')
  end

  def csv
  	require 'csv'

	c = CSV.generate do |csv| 
    	Vote.all.collect{|x| x.email}.uniq.each do |mail|
      		csv << [ mail ]
    	end
  	end

	headers['Content-Type'] = "text.csv"
	headers['Content-Disposition'] = 'attachment; filename="Mails.xls"'
	headers['Cache-Control'] = ''

  	render :text => c
  end #csv

end