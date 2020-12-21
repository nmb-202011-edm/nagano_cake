class Item < ApplicationRecord
  belongs_to :genre
  has_many :order_items
  has_many :orders, through: :order_items
  
  attachment :image
  
  validates :image, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
end
