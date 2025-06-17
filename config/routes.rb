Rails.application.routes.draw do
  devise_for :users
  # Define a rota raiz da aplicação
  root 'pessoas#index' # Ou qualquer outra página inicial que você queira

  # Rotas para Pessoas, Cursos e Inscrições
  # Isso cria todas as rotas RESTful padrão (index, show, new, create, edit, update, destroy)
  resources :pessoas do
    resource :documento, only: [:new, :create, :edit, :update, :destroy] # Documento aninhado em pessoa
  end
  resources :cursos
  resources :inscricoes, only: [:new, :create, :destroy] # Apenas as actions necessárias

  # Rotas de Login (serão definidas quando você implementar a autenticação)
  # Exemplo se usar Devise:
  # devise_for :users

  # Para usuários administradores, você pode ter um namespace:
  # namespace :admin do
  #   resources :pessoas
  #   resources :cursos
  #   # etc.
  # end
end