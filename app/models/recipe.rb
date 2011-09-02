class Recipe < ActiveRecord::Base
	belongs_to :user

	has_many :steps, :dependent => :destroy
	has_many :associations, :through => :steps
	has_many :ingredients,  :through => :associations

	validates :user_id, :presence => true
	validates :name, :presence => true

	#scope :public, where(:public => 1)
	
	def step_attributes=(step_attributes)
	  step_attributes.each do |attributes|
	    steps.build(attributes)
	  end
	end

	def self.public
		Recipe.where(:public => 1)
	end
end
