class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description
      t.string :image_url
      t.string :purchase_url
      t.string :youtube_url

      t.timestamps
      t.belongs_to :user, null: false
    end
  end
end
