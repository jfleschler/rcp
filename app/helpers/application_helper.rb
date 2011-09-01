module ApplicationHelper
	def new_ingredient_img_tag(step)
		image_tag 'newIngredient.png', :class => 'newIngredient', :id => step.id
	end

	def delete_step_tag(recipe, step)
		link_to "delete", recipe_step_path(recipe, step), :confirm => "Are you sure?", :method => :delete, :remote => true
	end

	def arrow_right_tag(recipe, step, association)
		link_to (image_tag 'arrow_right.png'), url_for(:controller => 'associations', :action => 'update', :move => 'right', :id => association), :move => "right", :method => 'put', :remote => true
	end

	def arrow_left_tag(recipe, step, association)
		link_to (image_tag 'arrow_left.png'), url_for(:controller => 'associations', :action => 'update', :move => 'left', :id => association), :method => 'put', :remote => true
	end

	def delete_association_tag(recipe, step, association)
		link_to (image_tag 'redx.png'), recipe_step_association_path(recipe, step, association), :confirm => "Are you sure?", :method => :delete, :remote => true
	end
end
