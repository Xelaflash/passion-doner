class Review < ApplicationRecord
  belongs_to :kebab

  validates :content, presence: true
  validates :bread_rating, presence: true, inclusion: { in: 1..5 }
  validates :fries_rating, presence: true, inclusion: { in: 1..5 }
  validates :meat_rating, presence: true, inclusion: { in: 1..5 }
  validates :sauces_rating, presence: true, inclusion: { in: 1..5 }
  validates :quantity_rating, presence: true, inclusion: { in: 1..5 }
  validates :quality_price_ratio, presence: true, inclusion: { in: 1..5 }
  # validates :overall_rating, presence: true, inclusion: { in: 1..5 }
end
