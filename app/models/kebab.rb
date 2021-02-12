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

  def average_rating
    reviews.average(:overall_rating)
  end
end
