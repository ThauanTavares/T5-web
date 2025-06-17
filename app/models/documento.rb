class Documento < ApplicationRecord
  belongs_to :pessoa

  validates :numero, presence: true, uniqueness: true # Exemplo de validação
end