class Item < ApplicationRecord
  def self.search(term)
    if term
      where('name ILIKE ?', "%#{term}%")
    else
      all
    end
  end

  validates :name, presence: true

  belongs_to :user
  has_many :reviews
end
