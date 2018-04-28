class Review < ActiveRecord::Base

  belongs_to :product, foreign_key: 'product_id'
  belongs_to :user, foreign_key: 'user_id'

  validates :product_id, presence: true
  validates :user_id, presence: true
  validates :rating, presence: true

end
