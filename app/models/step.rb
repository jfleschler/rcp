class Step < ActiveRecord::Base
	belongs_to :recipe
	has_many :associations, :dependent => :destroy
	has_many :ingredients, :through => :associations
end
