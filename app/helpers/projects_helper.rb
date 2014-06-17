module ProjectsHelper

  def format_average_stars(project)
   if project.average_stars.nil?
     content_tag(:strong, 'No reviews')
   else
    # "*" * project.average_stars.round
     pluralize(number_with_precision(project.average_stars, :precision => 1) , 'star')
   end
 end

 def delete_review_image
   image_tag('trash.png', style: 'border: 0', :title => 'Delete Review')
 end

end
