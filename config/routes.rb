Rails.application.routes.draw do
  get 'pedidoburger/new'
  get 'pedidoburger/create'
  devise_for :users

  get 'cardapio', to: 'compra#cardapio', as: 'cardapio'
  get 'checkout', to: 'compra#checkout', as: 'checkout'

  get 'pedidoburger', to: 'pedidoburger#new', as: 'pedidoburger'
  post 'pedidoburger', to: 'pedidoburger#create'
  delete 'pedidoburger/:id', to: 'pedidoburger#destroy'

  post 'pedidobebida', to: 'pedidobebida#create'
  delete 'pedidobebida/:id', to: 'pedidobebida#destroy'

  root to: 'pages#home'
end
