# test/models/pessoa_test.rb

require "test_helper"

class PessoaTest < ActiveSupport::TestCase
  test "deve salvar pessoa com first_name" do
    pessoa = Pessoa.new(first_name: "Han", last_name: "Solo", city: "Corellia")
    assert pessoa.save
  end

  test "nao deve salvar pessoa sem first_name" do
    pessoa = Pessoa.new(last_name: "Solo", city: "Corellia")
    assert_not pessoa.save, "Salvou a pessoa sem first_name"
  end

  test "pessoa deve ter cursos" do
    pessoa = pessoas(:luke) # Usa a fixture 'luke'
    assert_not_empty pessoa.cursos, "Pessoa não tem cursos associados"
  end
end