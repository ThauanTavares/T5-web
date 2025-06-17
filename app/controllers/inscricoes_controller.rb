# app/controllers/inscricoes_controller.rb
class InscricoesController < ApplicationController
  before_action :authorize_admin! # Garante que apenas admins acessem

  def new
    @inscricao = Inscricao.new
  end

  def create
    @inscricao = Inscricao.new(inscricao_params)

    if @inscricao.save
      redirect_to pessoa_url(@inscricao.pessoa), notice: "Inscrição criada com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @inscricao = Inscricao.find(params[:id])
    pessoa_a_redirecionar = @inscricao.pessoa
    @inscricao.destroy
    redirect_to pessoa_url(pessoa_a_redirecionar), notice: "Inscrição removida com sucesso."
  end

  private

  def inscricao_params
    params.require(:inscricao).permit(:pessoa_id, :curso_id)
  end

  def authorize_admin!
    # Adapte esta lógica se necessário, mas por padrão exige que o usuário seja admin
    redirect_to root_path, alert: "Acesso não autorizado." unless current_user&.admin?
  end
end