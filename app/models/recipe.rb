class Recipe < ActiveRecord::Base
	has_many :steps, :dependent => :destroy
	has_many :associations, :through => :steps
	has_many :ingredients,  :through => :associations
	
	def step_attributes=(step_attributes)
	  step_attributes.each do |attributes|
	    steps.build(attributes)
	  end
	end
end
