Rails.application.routes.draw do
  devise_for :users

  resources :endereco, only: [:index, :new, :create, :destroy]
  get 'setendereco/:enderecoid', to: 'endereco#setendereco', as: 'setendereco'

  resources :pedido, only: [:index, :show, :update]

  get 'cardapio', to: 'compra#cardapio', as: 'cardapio'
  get 'checkout', to: 'compra#checkout', as: 'checkout'
  get 'addresspick', to: 'compra#addresspick', as: 'addresspick'

  get 'pedidoburger', to: 'pedidoburger#new', as: 'pedidoburger'
  post 'pedidoburger', to: 'pedidoburger#create'
  delete 'pedidoburger/:id', to: 'pedidoburger#destroy'

  post 'pedidobebida', to: 'pedidobebida#create'
  delete 'pedidobebida/:id', to: 'pedidobebida#destroy'

  root to: 'pages#home'
end
