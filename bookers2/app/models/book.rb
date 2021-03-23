class Book < ApplicationRecord

  # ３章で追加。userモデルとの紐付け
  belongs_to :user

  # validates :title, presence: true
  # validates :body, presence: true
# # カラムに対する制限
validates :title, {presence: true}
validates :body, {presence: true, length: {maximum: 200}}

  # 使うかわからんけど一応置いておく
  # attachment :image

end
