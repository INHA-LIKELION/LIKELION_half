Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'

  get 'home/index'

  get 'about/aboutindex' => 'about#aboutindex'
  get 'kitshare/kitshareindex' => 'kitshare#kitshareindex'
  get 'toolgroup/toolgroupindex' => 'toolgroup#toolgroupindex'

  post 'kitshare/create'
  get 'kitshare/destroy/:id' => 'kitshare#destroy'
  get 'kitshare/update/:id' => 'kitshare#update'
  post 'kitshare/reaL_update/id' => 'kitshare#real_update'
  get 'kitshare/:kitshare_id/comment_create' => 'kitshare#comment_create'
  get 'kitshare/:kitshare_id/kitsharecomment/:id/comment_destroy' => 'kitshare#comment_destroy'

  post 'toolgroup/create'
  get 'toolgroup/destroy/:id' => 'toolgroup#destroy'
  get 'toolgroup/update/:id' => 'toolgroup#update'
  post 'toolgroup/reaL_update/id' => 'toolgroup#real_update'
  get 'toolgroup/:toolgroup_id/comment_create' => 'toolgroup#comment_create'
  get 'toolgroup/:toolgroup_id/toolgroupcomment/:id/comment_destroy' => 'toolgroup#comment_destroy'
end
