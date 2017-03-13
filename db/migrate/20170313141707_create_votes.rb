class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.integer "review_id", null: false
      t.integer "user_id", null: false
      t.integer "value"

      t.belongs_to :user, null: false
      t.belongs_to :review, null: false
    end
  end
end
