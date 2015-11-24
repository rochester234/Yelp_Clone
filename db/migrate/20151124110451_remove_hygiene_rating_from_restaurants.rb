class RemoveHygieneRatingFromRestaurants < ActiveRecord::Migration
  def change
    remove_column :restaurants, :hygiene_rating, :text
  end
end
