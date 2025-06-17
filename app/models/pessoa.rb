class Pessoa < ApplicationRecord
  has_one :documento, dependent: :destroy
  has_many :inscricoes, class_name: "Inscricao", dependent: :destroy
  has_many :cursos, through: :inscricoes

  accepts_nested_attributes_for :documento, allow_destroy: true, reject_if: :all_blank

  validates :first_name, presence: true
end