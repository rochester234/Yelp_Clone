class AddHygieneRatingToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :hygiene_rating, :text
  end
end
