class Book < ApplicationRecord
  validates :category_id,     presence: true
  validates :title,           presence: true
  validates :author,          presence: true
  validates :description,     presence: true
  validates :image,           presence: true
  
  has_one_attached :image
  belongs_to       :user
end
