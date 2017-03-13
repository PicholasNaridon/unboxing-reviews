class AddVotesToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :sum_votes, :integer, default: 0, null: false
  end
end
