Rails.application.routes.draw do

  root 'welcome#index'

  devise_for :users

  namespace :admin do
    resources :products
    resources :orders do
      member do
        post :cancel
        post :ship
        post :shipped
        post :return
      end
    end

    resources :intros do
      member do
        post :publish
        post :hide
      end
    end

  end

  resources :products do
    member do
      post :add_to_cart
      post :add_to_wish_list
      post :remove_from_wish_list
    end
  end

  resources :carts do
    collection do
      delete :clean
      post :checkout
    end
  end

  resources :cart_items

  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
      post :apply_to_cancel
    end
  end

  namespace :account do
    resources :orders
    resources :products do
      member do
        post :add_to_cart
        post :remove_from_wish_list
      end
    end
  end

end
