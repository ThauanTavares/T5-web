# app/models/inscricao.rb

class Inscricao < ApplicationRecord
  belongs_to :pessoa
  belongs_to :curso

  # Garante que uma pessoa não pode se inscrever no mesmo curso mais de uma vez
  validates :pessoa_id, uniqueness: { scope: :curso_id }
end