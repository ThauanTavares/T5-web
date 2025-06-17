# db/seeds.rb

# 1. Limpa o banco de dados para garantir um estado inicial limpo
# A ordem é importante para respeitar as dependências
puts "Limpando o banco de dados..."
Inscricao.destroy_all
Documento.destroy_all
Curso.destroy_all
Pessoa.destroy_all
User.destroy_all


# 2. Cria o usuário Administrador
puts "Criando usuário admin..."
User.find_or_create_by!(email: 'yoda@wars.com') do |user|
  user.password = 'masteryoda'
  user.password_confirmation = 'masteryoda'
  user.role = :admin
end
puts "=> Admin criado: yoda@wars.com | Senha: masteryoda"


# 3. Cria os Cursos padrão
puts "\nCriando cursos padrão..."
nomes_dos_cursos = ["Jedi", "Sith", "Piloto"]
cursos = nomes_dos_cursos.map { |nome| Curso.create!(nome: nome) }
puts "=> Cursos criados: #{nomes_dos_cursos.join(', ')}"


# 4. Define os dados dos Personagens (seu padrão)
personagens_data = [
  { first_name: "Luke", last_name: "Skywalker", city: "Tatooine" },
  { first_name: "Leia", last_name: "Organa", city: "Alderaan" },
  { first_name: "Anakin", last_name: "Skywalker", city: "Tatooine" },
  { first_name: "Obi-Wan", last_name: "Kenobi", city: "Stewjon" },
  { first_name: "Padmé", last_name: "Amidala", city: "Naboo" },
  { first_name: "Yoda", last_name: "", city: "Dagobah" },
  { first_name: "Darth", last_name: "Maul", city: "Dathomir" },
  { first_name: "Rey", last_name: "", city: "Jakku" },
  { first_name: "Finn", last_name: "", city: "FN-2187" },
  { first_name: "Poe", last_name: "Dameron", city: "Yavin IV" }
]


# 5. Cria os Personagens e suas relações
puts "\nCriando personagens e suas relações (Documentos e Inscrições)..."
personagens_data.each_with_index do |personagem_info, i|
  # Cria a Pessoa
  pessoa = Pessoa.create!(
    first_name: personagem_info[:first_name],
    last_name: personagem_info[:last_name],
    address: "Endereço desconhecido",
    city: personagem_info[:city]
  )

  # Relação 1-para-1: Cria um Documento para cada Pessoa
  Documento.create!(numero: "DOC-#{1000 + i}", pessoa: pessoa)

  # Relação N-para-N: Inscreve a Pessoa em um dos cursos
  curso_para_inscrever = cursos[i % cursos.length] # Pega um curso da lista de forma cíclica
  Inscricao.create!(pessoa: pessoa, curso: curso_para_inscrever)

  puts "-> Criado: #{pessoa.first_name} (Documento: DOC-#{1000 + i}, Curso: #{curso_para_inscrever.nome})"
end

puts "\nSeed finalizado com sucesso!"