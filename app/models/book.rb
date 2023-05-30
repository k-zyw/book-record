class Book < ApplicationRecord
  validates :category_id,     presence: true
  validates :title,           presence: true
  validates :author,          presence: true
  validates :description,     presence: true
  validates :image,           presence: true
  
  has_one_attached :image
  belongs_to       :user
  has_many         :comments,  dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  validates :category_id,           numericality:{ other_than: 1 ,}

 def self.search(search)
  if search != ""
    Book.where('title LIKE(?)', "%#{search}%")
  else
    Book.all
  end
 end
end
