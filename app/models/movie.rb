class Movie < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :likes
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category
  has_many :comments, dependent: :destroy

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  validates :image, :name, :explanation, :category, presence: true
  validates :category_id, numericality: { other_than: 1 }
end
