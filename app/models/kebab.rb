class Kebab < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, uniqueness: true, presence: true
  validates :address, uniqueness: true , presence: true
  validates :description, presence: true
end
