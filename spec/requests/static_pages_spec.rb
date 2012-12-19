require 'spec_helper'

describe "StaticPages" do

  describe "Home Page" do

    it "should have the content 'Color en Movimiento' " do
    	visit '/static_pages/home'
    	page.should have_content('Color en Movimiento')

    end
  end
end
