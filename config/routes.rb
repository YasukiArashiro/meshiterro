Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'post_images#index'

  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
  	resource :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  #resourcesメソッドは、ルーティングを一括して自動生成してくれます。
  #一方、onlyは、生成するルーティングを限定するオプションです。
  #画像投稿には、「新規投稿」「一覧」「詳細機能」しか使わないため、不要なルーティングが実行されないようにonlyを設定します。

  #２番目のresourceは「単数形」になっている。単数にすると、そのコントローラのidがリクエストに含まれなくなります。
  #今回、コメントの詳細ページは作成しません。
  #post_commentsのshowページが不要で、idの受け渡しも必要ないので、resourceとなっています。

  resources :users, only: [:show, :edit, :update]

end
