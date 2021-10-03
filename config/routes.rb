Rails.application.routes.draw do
  devise_for :users
  root to: "lunches#index"
  resources :lunches  do
    resources :comments, only: :create
  end
#コメントを投稿する際には、どの給食に対するコメントなのかをパスから判断できるようにするためにlunchesコントローラーにcommentsコントローラーをネストさせている
# commentsコントローラーに関してはコメントを投稿するだけなのでcreateアクションのルーティングのみを定義すれば良い
  resources :users, only: :show
end
