Rails.application.routes.draw do
  
  root 'public/homes#top'
  get '/about' => 'public/homes#about'
  
  get '/admin' => 'admin/homes#top'
  
  scope module: :public do
    devise_for :customers, controllers: {
      sessions: 'public/customers/sessions',
      registrations: 'public/customers/registrations',
    }, skip: [:passwords]
    
    resources :items, only: [:index, :show]
    get '/customers/my_page' => 'customers#show'
    resource :customers, only: [:edit, :update]
    get '/customers/unsubscribe' => 'customers#unsubscribe'
    get '/customers/withdraw' => 'customers#withdraw'
    resources :cart_items, only: [:index, :update, :destroy, :create]
    get '/cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :orders, only: [:new, :create, :index, :show]
    get '/orders/confirm' => 'orders#comfirm'
    get '/orders/complete' => 'orders#complete'
    resources :addresses, only: [:create, :index, :edit, :update, :destroy]
  end
  
  scope module: :admin do
    devise_for :admin, controllers: {
      sessions: 'admin/admin/sessions',
    }, skip: [:passwords, :registrations]
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
