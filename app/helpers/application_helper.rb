module ApplicationHelper

  def cart_empty?(cartTotal)
    if cartTotal.to_i == 0 
      true
    else 
      false
    end
  end

  def show_stars(rating)
    content_tag :span do
      rating.times do
        concat(image_tag "rating-star-icon.png", :class => "rating-star")
      end
    end
  end

end
