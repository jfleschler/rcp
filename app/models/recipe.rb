class Recipe < ActiveRecord::Base
	belongs_to :user

	has_many :steps, :dependent => :destroy
	has_many :associations, :through => :steps
	has_many :ingredients,  :through => :associations

	validates :user_id, :presence => true
	validates :name, :presence => true

	acts_as_taggable
	acts_as_taggable_on :tags

	default_scope order(:id)
	scope :public, lambda { where(:public => true) }
	
	before_save :build_tag_list
	before_destroy :remove_ingredient

	def step_attributes=(step_attributes)
	  step_attributes.each do |attributes|
	    steps.build(attributes)
	  end
	end

	def temperature
		cook_temp.to_s + temp_unit.to_s
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

	def remove_ingredient
		unless has_ingredient == nil
			i = Ingredient.find(has_ingredient)
			i.destroy
		end
	end
end
