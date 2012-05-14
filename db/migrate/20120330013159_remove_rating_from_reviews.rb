class RemoveRatingFromReviews < ActiveRecord::Migration
  def up
    remove_column :reviews, :rating
      end

  def down
    add_column :reviews, :rating, :string
  end
end
