class Recipe < ActiveRecord::Base
	belongs_to :user

	has_many :steps, :dependent => :destroy
	has_many :associations, :through => :steps
	has_many :ingredients,  :through => :associations

	validates :user_id, :presence => true
	validates :name, :presence => true

	acts_as_taggable
	acts_as_taggable_on :tags

	scope :public, lambda { where(:public => true) }
	
	before_save :build_tag_list

	def step_attributes=(step_attributes)
	  step_attributes.each do |attributes|
	    steps.build(attributes)
	  end
	end

	def build_tag_list
		tag_list.clear

		Keyword.all.each do |k|
			if name.include? k.word
				tag_list.add(k.word)
			end
		end

		ingredients.each do |i|
			tag_list.add(i.tag_name)
		end
	end
end
