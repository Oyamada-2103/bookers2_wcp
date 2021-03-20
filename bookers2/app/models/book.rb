class Book < ApplicationRecord
  
  # ３章で追加。userモデルとの紐付け
  belongs_to :user
  
  
  # 使うかわからんけど一応置いておく
  # attachment :image 
  
end
