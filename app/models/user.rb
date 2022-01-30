class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :reviews
  has_many :favorites, foreign_key: :user_id, dependent: :destroy
  has_many :likes, through: :favorites, source: :review
  
    def favorite(review)
        self.favorites.find_or_create_by(review_id: review.id)
    end
    
    def unfavorite(review)
        favorite = self.favorites.find_by(review_id: review.id)
        favorite.destroy if favorite
    end
    
    def likes?(review)
        self.likes.include?(review)
    end
  
end
