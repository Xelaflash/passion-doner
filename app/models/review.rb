class Review < ApplicationRecord
  belongs_to :kebab

  validates :author, presence: true
  validates :content, presence: true
  validates :bread_rating, presence: true
  validates :fries_rating, presence: true
  validates :meat_rating, presence: true
  validates :sauces_rating, presence: true
  validates :quantity_rating, presence: true
  validates :quality_price_ratio, presence: true
  validates :overall_rating, presence: true
end
