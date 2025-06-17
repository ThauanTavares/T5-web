# test/controllers/inscricoes_controller_test.rb

require "test_helper"

class InscricoesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pessoa_para_inscrever = pessoas(:leia)
    @curso_para_inscrever = cursos(:sith)
    sign_in users(:admin)
  end

  test "should get new" do
    get new_inscricao_url
    assert_response :success
  end

  test "should create inscricao" do
    assert_difference("Inscricao.count") do
      post inscricoes_url, params: { inscricao: { pessoa_id: @pessoa_para_inscrever.id, curso_id: @curso_para_inscrever.id } }
    end

    assert_redirected_to pessoa_url(@pessoa_para_inscrever)
  end

  test "should destroy inscricao" do

    inscricao_a_destruir = Inscricao.find_by!(pessoa: pessoas(:luke), curso: cursos(:jedi))

    assert_difference("Inscricao.count", -1) do
      delete inscricao_url(inscricao_a_destruir)
    end

    assert_redirected_to pessoa_url(inscricao_a_destruir.pessoa)
  end
end