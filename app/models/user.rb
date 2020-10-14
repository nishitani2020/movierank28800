class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments, dependent: :destroy
  has_many :movies, dependent: :destroy
  has_many :likes, dependent: :destroy
 
  def liked_by?(movie_id)
    likes.where(movie_id: movie_id).exists?
  end
  
  validates :nickname, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  validates :password, format: { with: /\A[0-9A-Za-z]+\z/ }
  
end
