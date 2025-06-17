class CreateInscricaos < ActiveRecord::Migration[7.1]
  def change
    create_table :inscricoes do |t|
      t.references :pessoa, null: false, foreign_key: true
      t.references :curso, null: false, foreign_key: true

      t.timestamps
    end
  end
end
