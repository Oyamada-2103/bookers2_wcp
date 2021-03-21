class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

# ３章で追加。bookモデルとの紐付け
has_many :books, dependent: :destroy

# refileを使って、画像投稿ができるように
attachment :profile_image
# attachmentには、カラム名（profile_image_id）から_idを除いた名前（profile_image）を記述します
end
