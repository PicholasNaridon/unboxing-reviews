class Review < ApplicationRecord
  validates :body, presence: true
  belongs_to :item
  belongs_to :user
end
