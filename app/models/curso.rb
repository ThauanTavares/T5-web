class Curso < ApplicationRecord
  # Define o caminho para chegar em Pessoas
  has_many :inscricoes, class_name: "Inscricao", dependent: :destroy
  has_many :pessoas, through: :inscricoes

  validates :nome, presence: true, uniqueness: true
end