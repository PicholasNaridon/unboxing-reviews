class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.text :body, null: false
      t.integer :rating
      t.belongs_to :item
      t.belongs_to :user
      t.timestamps
    end
  end
end
