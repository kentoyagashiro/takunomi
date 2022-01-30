class Review < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :comment, presence: true, length: { maximum: 50 }
  validates :combi, presence: true, length: { maximum: 20 }
  validates :buystore, presence: true, length: { maximum: 20 }
  
  belongs_to :user
  has_many :favorites, foreign_key: "review_id", dependent: :destroy
end
