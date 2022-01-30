class Favorite < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :review, optional: true
end
