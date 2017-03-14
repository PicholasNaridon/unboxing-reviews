class Item < ApplicationRecord
  def self.search(term)
    if term
      where('name ILIKE ?', "%#{term}%")
    else
      all
    end
  end

  validates :name, presence: true
  validates :purchase_url, url: true, if: [:purchase_url?]
  validates :youtube_url, url: true, if: [:youtube_url?]
  validates :image_url, url: true, if: [:image_url?]
  belongs_to :user
  has_many :reviews
end
