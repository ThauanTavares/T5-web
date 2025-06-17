# app/controllers/cursos_controller.rb
class CursosController < ApplicationController
  before_action :set_curso, only: %i[ show edit update destroy ]
  before_action :authorize_admin!, except: %i[ index show ]

  def index
    @cursos = Curso.all
  end

  def show
  end

  def new
    @curso = Curso.new
  end

  def edit
  end

  def create
    @curso = Curso.new(curso_params)
    if @curso.save
      redirect_to @curso, notice: 'Curso criado com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @curso.update(curso_params)
      redirect_to @curso, notice: 'Curso atualizado com sucesso.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @curso.destroy
    redirect_to cursos_url, notice: 'Curso destruído com sucesso.'
  end

  private

  def set_curso
    @curso = Curso.find(params[:id])
  end

  def curso_params
    params.require(:curso).permit(:nome)
  end

  def authorize_admin!
    redirect_to root_path, alert: "Acesso não autorizado." unless current_user&.admin?
  end
end