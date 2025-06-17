class PessoasController < ApplicationController
  before_action :set_pessoa, only: %i[ show edit update destroy ]
  # Apenas admins podem fazer qualquer coisa exceto ver a lista e os detalhes
  before_action :authorize_admin!, except: %i[ index show ]

  def index
    @pessoas = Pessoa.all
  end

  def show
    # Para o formulário de inscrição de curso na página show
    @inscricao = Inscricao.new(pessoa: @pessoa)
  end

  def new
    @pessoa = Pessoa.new
    # Constrói um documento em branco para o formulário de nova pessoa
    @pessoa.build_documento
  end

  def edit
  end

  def create
    @pessoa = Pessoa.new(pessoa_params)
    if @pessoa.save
      redirect_to @pessoa, notice: 'Pessoa criada com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @pessoa.update(pessoa_params)
      redirect_to @pessoa, notice: 'Pessoa atualizada com sucesso.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @pessoa.destroy
    redirect_to pessoas_url, notice: 'Pessoa destruída com sucesso.'
  end

  private

  def set_pessoa
    @pessoa = Pessoa.find(params[:id])
  end

  # Atualiza os parâmetros para aceitar os do documento aninhado
  def pessoa_params
    params.require(:pessoa).permit(:first_name, :last_name, :address, :city, 
                                   documento_attributes: [:id, :numero, :_destroy])
  end

  def authorize_admin!
    redirect_to root_path, alert: "Acesso não autorizado." unless current_user&.admin?
  end
end