class Movie < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :likes
  belongs_to :user
  has_many :comments, dependent: :destroy
  
  has_one_attached :image
  belongs_to_active_hash :category

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  validates :image, :name, :explanation, :category, presence: true
  validates :category_id, numericality: { other_than: 1 }
end
