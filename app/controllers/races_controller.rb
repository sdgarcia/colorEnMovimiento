class RacesController < ApplicationController
  layout 'admin'
  before_filter :admin_required

end