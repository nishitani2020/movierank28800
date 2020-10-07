class Movie < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category
  has_many :comments

  validates :image, :name, :explanation, :category, presence: true
  

  validates :category_id, numericality: { other_than: 1 }
end
