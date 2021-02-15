class Kebab < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, uniqueness: true, presence: true
  validates :address, uniqueness: true, presence: true
  validates :description, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_one_attached :photo

  extend FriendlyId
  friendly_id :name, use: :slugged

  acts_as_taggable_on :bread_category

  include PgSearch::Model
  pg_search_scope :search_by_name_and_address,
    against: [ :name, :address ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  def average_rating
    reviews.average(:overall_rating)
  end

  def bread_avg
    reviews.average(:bread_rating)
  end

  def fries_avg
    reviews.average(:fries_rating)
  end

  def meat_avg
    reviews.average(:meat_rating)
  end

  def sauces_avg
    reviews.average(:sauces_rating)
  end

  def quantity_avg
    reviews.average(:quantity_rating)
  end

  def quality_price_ratio_avg
    reviews.average(:quality_price_ratio)
  end
end
