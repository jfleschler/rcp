class Recipe < ActiveRecord::Base
	has_many :steps, :dependent => :destroy

	def step_attributes=(step_attributes)
	  step_attributes.each do |attributes|
	    steps.build(attributes)
	  end
	end
end
