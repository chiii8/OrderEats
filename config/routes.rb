Rails.application.routes.draw do
  # 顧客用
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  # 管理者用
  devise_for :admins, skip: [:registration, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # 管理者側
  namespace :admin do
    resources :items, except: [:destroy]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
    resources :customers, only: [:index, :show, :edit, :update]
    
    get 'admin', to: 'admin/home#top'
  end
  # 顧客側
  scope module: :public do
    resources :items, only: [:index, :show]
    resources :customers, only: [:update]
      get '/customers/withdraw_confirm' => 'customers#withdraw_confirm', as: "withdraw_confirm"
      patch '/customers/withdraw' => 'customers#withdraw'
      get '/customers/mypage' => 'customers#show'
      get 'customers/infomation/edit' => 'customers#edit'
      get 'customers/favorite' => 'customers#favorite', as: "favorite"
    resources :cart_items, except: [:show, :edit, :new]
      delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :orders, only: [:new, :index, :show, :create]
      get 'orders/confirm' => 'orders#confirm', as: "confirm"
      get 'orders/thanks' => 'orders#thanks', as: "thanks"
      get 'orders/possible' => 'orders#possible', as: "possible"
      get 'orders/production' => 'orders#production', as: "prodction"
      get 'orders/review' => 'orders#review', as: "review"
      
      root to: 'homes#top'
      get '/about' => 'homes#about'
  end
end
