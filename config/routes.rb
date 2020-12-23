Rails.application.routes.draw do

  get 'search/search'
  root 'public/homes#top'
  get '/search' => 'search#search'

  get '/about' => 'public/homes#about'

  get '/admin' => 'admin/homes#top'

  scope module: :public do

    resources :items, only: [:index, :show]
    get '/customers/my_page' => 'customers#my_page'
    patch '/customers' => 'customers#update'
    get '/customers/my_page/edit' => 'customers#edit'
    get '/customers/unsubscribe' => 'customers#unsubscribe'
    #get=>patchに変更
    patch '/customers/withdraw' => 'customers#withdraw'
    resources :cart_items, only: [:index, :update, :destroy, :create]
    get '/cart_items/destroy_all' => 'cart_items#destroy_all'
    get '/orders/confirm' => 'orders#confirm'
    get '/orders/complete' => 'orders#complete'
    resources :orders, only: [:new, :create, :index, :show]
    resources :addresses, only: [:create, :index, :edit, :update, :destroy]

    devise_for :customers, controllers: {
      sessions: 'public/customers/sessions',
      registrations: 'public/customers/registrations',
      passwords: 'public/customers/passwords'
    }

  end

  scope module: :admin do
    devise_for :admin, controllers: {
      sessions: 'admin/admin/sessions',
      passwords: 'admin/admin/passwords',
      registrations: 'admin/admin/registrations'
    }
  end

  namespace :admin do
    resources :items, :except => :destroy
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update] do
      resources :order_items, only: [:update]
    end
  end


end
