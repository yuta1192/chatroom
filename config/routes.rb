Rails.application.routes.draw do
  root to: 'chats#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

# => if overridden routes generated controllers routes.rb
#  devise_for :users, controllers: {
#    sessions: 'users/sessions'
#  }

end
