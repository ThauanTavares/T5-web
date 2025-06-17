class CreateDocumentos < ActiveRecord::Migration[7.1] # Plural
  def change
    create_table :documentos do |t|
      t.string :numero
      t.references :pessoa, null: false, foreign_key: true

      t.timestamps
    end
  end
end
