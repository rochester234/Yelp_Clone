class Review < ActiveRecord::Base

  belongs_to :restaurant
  validates :rating, inclusion: (1..5)

  validates :user_id, :uniqueness => { :scope => :restaurant_id,
                                    :message => "User can only write one review per restuarant"}
end
