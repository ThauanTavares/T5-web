class ApplicationController < ActionController::Base
  before_action :authenticate_user! # Exige login para todas as ações, a menos que especificado o contrário

  # Disponibiliza current_user para as views também (Devise já faz isso, mas é bom saber)
  helper_method :current_user

  protected

  def authorize_admin!
    redirect_to root_path, alert: "Acesso não autorizado." unless current_user.admin?
  end
end

class PessoasController < ApplicationController
  # Usuários não logados não podem ver nada, exceto se você usar skip_before_action
  # skip_before_action :authenticate_user!, only: [:index, :show] # Se quiser permitir visualização para não logados

  # Apenas admins podem criar, editar, atualizar, destruir
  before_action :authorize_admin!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @pessoas = Pessoa.all
    # @current_user estará disponível aqui e nas views
  end

  # ... outras actions
end