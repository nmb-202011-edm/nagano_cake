class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order
  
    enum production_status:{
    cannot: 0, #着手不可
    wait: 1, #制作待ち
    production: 2, #制作中
    complete: 3, #制作完了
  }
end
