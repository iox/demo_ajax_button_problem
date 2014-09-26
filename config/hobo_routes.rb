# This is an auto-generated file: don't edit!
# You can add your own routes in the config/routes.rb file
# which will override the routes in this file.

DemoAjaxButton::Application.routes.draw do


  # Resource routes for controller users
  resources :users, :only => [:edit, :show, :create, :update, :destroy] do
    collection do
      post 'signup', :action => 'do_signup'
      get 'signup'
    end
    member do
      get 'account'
      put 'reset_password', :action => 'do_reset_password'
      get 'reset_password'
    end
  end

  # User routes for controller users
  post 'login(.:format)' => 'users#login', :as => 'user_login_post'
  get 'login(.:format)' => 'users#login', :as => 'user_login'
  get 'logout(.:format)' => 'users#logout', :as => 'user_logout'
  get 'forgot_password(.:format)' => 'users#forgot_password', :as => 'user_forgot_password'
  post 'forgot_password(.:format)' => 'users#forgot_password', :as => 'user_forgot_password_post'


  # Resource routes for controller agenda_subitems
  resources :agenda_subitems, :only => [:new, :edit, :show, :create, :update, :destroy]

  # Owner routes for controller agenda_subitems
  resources :agenda_items, :as => :agenda_item, :only => [] do
    resources :agenda_subitems, :only => [] do
      get '/', :on => :new, :action => 'new_for_agenda_item'
      collection do
        get '/', :action => 'index_for_agenda_item'
        post '/', :action => 'create_for_agenda_item'
      end
    end
  end


  # Resource routes for controller agenda_items
  resources :agenda_items, :only => [:new, :edit, :show, :create, :update, :destroy]

  # Owner routes for controller agenda_items
  resources :agendas, :as => :agenda, :only => [] do
    resources :agenda_items, :only => [] do
      get '/', :on => :new, :action => 'new_for_agenda'
      collection do
        get '/', :action => 'index_for_agenda'
        post '/', :action => 'create_for_agenda'
      end
    end
  end


  # Resource routes for controller agendas
  resources :agendas

  namespace :concerns do

  end

end
