class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_images, dependent: :destroy
  #has_manyの後ろには、このモデル（User）と１：Nの関係になるモデルを「複数形」で記述する。
  has_many :post_comments, dependent: :destroy
  #dependent: :destroyは、has_manyで使えるオプションです。
  #1:Nの関係において、「1」のデータが削除された場合、関連する「N」のデータも削除される設定です。
  #この設定では、Userのデータが削除されたとき、そのUserが投稿したコメントデータも一緒に削除されます。
  has_many :favorites, dependent: :destroy
  attachment :profile_image


end
