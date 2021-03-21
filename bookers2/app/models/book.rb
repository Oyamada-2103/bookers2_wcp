class Book < ApplicationRecord
  
  # ３章で追加。userモデルとの紐付け
  belongs_to :user
  
  validates :title, presence: true
  validates :opinion, presence: true
  
  # 使うかわからんけど一応置いておく
  # attachment :image 
  
end
