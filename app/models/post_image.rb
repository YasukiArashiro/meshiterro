class PostImage < ApplicationRecord

	belongs_to :user
	#belong_toはhas_manyと逆の機能。PostImageモデルに関連付けできるのは、１つのUserモデルだけのため、単数形の「user」になっている。

	attachment :image #ここを追加（_idは含めない）
	#画像アップロードは、<%= f.attachment_field :image %>で実装しています。
	#指定するフィールド名は、image_idから_idを除いた名前（image）を指定します。
	#また、モデルに、画像アップ用のメソッド（attachment）を追加してフィールド名に（image）を指定します。
	#この2つは、refileを使用するうえでのルールです。


end
