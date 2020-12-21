class Order < ApplicationRecord
  has_many :order_items
  has_many :items, through: :order_items
  
  enum payment_method:{
    bank: 0, #銀行振込
    card: 1, #クレジットカード
  }
  
  enum status:{
    waiting: 0, #入金待ち
    deposited: 1, #入金確認
    making: 2, #制作中
    ready: 3, #発送準備中
    sent: 4 #発送済み
  }
end
