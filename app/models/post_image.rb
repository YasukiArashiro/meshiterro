class PostImage < ApplicationRecord

	belongs_to :user
	#belong_toはhas_manyと逆の機能。PostImageモデルに関連付けできるのは、１つのUserモデルだけのため、単数形の「user」になっている。
	#複数と関連付できると、一つの画像を複数の人が投稿したことになってしまう。

	attachment :image #ここを追加（_idは含めない）
	#画像アップロードは、<%= f.attachment_field :image %>で実装しています。
	#指定するフィールド名は、image_idから_idを除いた名前（image）を指定します。
	#また、モデルに、画像アップ用のメソッド（attachment）を追加してフィールド名に（image）を指定します。
	#この2つは、refileを使用するうえでのルールです。

	has_many :post_comments, dependent: :destroy
	#post_imageモデルと１：Nの関係になるモデルを記述。

	has_many :favorites, dependent: :destroy

	validates :shop_name, presence: true
	validates :image, presence: true


	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end


end
