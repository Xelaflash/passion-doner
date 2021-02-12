class Kebab < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, uniqueness: true, presence: true
  validates :address, uniqueness: true, presence: true
  validates :description, presence: true

  has_one_attached :photo

  extend FriendlyId
  friendly_id :name, use: :slugged

  acts_as_taggable_on :bread_category

  def average_rating
    reviews.average(:overall_rating)
  end
end
