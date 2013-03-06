class Option < ActiveRecord::Base
	attr_accessible :key, :value
	validates_presence_of :key

	def self.get(xkey)
		(o = Option.where(:key => xkey).first )? o.value : nil
	end #get


end