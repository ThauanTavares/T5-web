# db/migrate/20250604213009_add_role_to_users.rb
class AddRoleToUsers < ActiveRecord::Migration[7.1] # Certifique-se que esta versão [7.0] corresponde à sua (ou [6.1], [7.1] etc.)
  def change
    # Adiciona a coluna 'role' à tabela 'users'.
    # Ela será do tipo 'integer'.
    # O valor padrão para novos registros será 0.
    # 'null: false' significa que esta coluna não pode ficar vazia no banco de dados.
    add_column :users, :role, :integer, default: 0, null: false
  end
end