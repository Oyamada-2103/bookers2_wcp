class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

# ３章で追加。bookモデルとの紐付け
has_many :books, dependent: :destroy


# カラムに対する制限
validates :name, {uniqueness: true, length: {minimum:2, maximum: 20}}
validates :introduction, {length: {maximum: 50}}


# refileを使って、画像投稿ができるように
attachment :profile_image
# attachmentには、カラム名（profile_image_id）から_idを除いた名前（profile_image）を記述します

# validates :name, presence: true, uniqueness: true, length: { minimum :2, maximum :20 } 入れたら何も開けなくなった


end
