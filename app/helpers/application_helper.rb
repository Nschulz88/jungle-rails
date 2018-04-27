module ApplicationHelper

  def cart_empty?(cartTotal)
    if cartTotal.to_i == 0 
      true
    else 
      false
    end
  end

end
