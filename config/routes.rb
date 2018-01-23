Rails.application.routes.draw do
  root to: "usuarios#index"

  # Posts controller
  resources :posts

  # Sessoes controller
  get 'login', to: "sessoes#new", as: :login
  post 'login', to: "sessoes#create"
  delete 'logout', to: "sessoes#destroy", as: :logout

  # Usuarios controller
  get 'usuarios/novo', to: "usuarios#new", as: :new_usuario
  post 'usuarios/novo', to: "usuarios#create"
  get 'usuarios/editar/:id', to: "usuarios#edit", as: :edit_usuario
  patch 'usuarios/editar/:id', to: "usuarios#update"
  # ao se utilizar rotas que possuem parametros, coloca-las por ultimo
  # se não o Rails vai confundir o nome da rota com um parametro
  get 'usuarios/:id', to: "usuarios#show", as: :show_usuario
  delete 'usuarios/:id', to: "usuarios#destroy", as: :destroy_usuario
  get 'usuarios', to: "usuarios#index", as: :index_usuarios

end
