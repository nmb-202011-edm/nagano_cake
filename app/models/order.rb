class Order < ApplicationRecord
  has_many :order_items
  has_many :items
  
  enum payment_method:{
    card: 0, #クレジットカード
    bank: 1, #銀行振込
  }
  
  enum status:{
    nobel: 0, #入金待ち
    essay: 1, #入金確認
    : 2, #制作中
    essay: 3, #発送準備中
    essay: 4, #発送済
  }
end
