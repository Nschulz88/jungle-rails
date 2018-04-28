class ReviewsController < ApplicationController

  before_filter :authorize

  def create  
    # product_to_be_reviewed =  Product.find params[:id]
    product = Product.find(params['product_id'])
    review = product.reviews.new(
      description: params['review']['description'], 
      rating: params['review']['rating'],
      product_id: params['product_id'],
      user_id: current_user[:id]
      )

    puts "-------- params #{params} -----------------"
    puts "-------- params review #{@review} -----------------"

    if review.save
      puts "YEYYYYYYYYY IT SAVED!!!!!!"
      redirect_to product
    else
      redirect_to '/products'
    end
  end


  def destroy
    product = Product.find(params['product_id'])
    review = Review.find(params[:id])
    review.destroy
    redirect_to product
  end


end
