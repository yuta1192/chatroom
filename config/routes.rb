Rails.application.routes.draw do
  root to: 'chats#index'
  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks" }


# => if overridden routes generated controllers routes.rb
#  devise_for :users, controllers: {
#    sessions: 'users/sessions'
#  }

  mount ActionCable.server => '/cable'
end
