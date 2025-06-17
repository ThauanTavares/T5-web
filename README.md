# Trabalho 5: Aplicação Rails -

Aplicação web desenvolvida em Ruby on Rails como parte dos requisitos da disciplina de desenvolvimento web.

O projeto simula um sistema de gerenciamento para uma "academia" do universo Star Wars, permitindo o cadastro de personagens (alunos), cursos e suas respectivas inscrições, com diferentes níveis de permissão para administradores e usuários comuns.

---

## Funcionalidades Principais

* **Autenticação de Usuários:** Sistema completo de registro, login e logout utilizando a gem Devise.
* **Níveis de Permissão:**
    * **Administrador:** Tem controle total sobre a aplicação. Pode criar, editar e excluir personagens, cursos e inscrições.
    * **Usuário Comum:** Pode apenas visualizar os dados existentes (personagens, cursos e quem está inscrito).
* **Gerenciamento de Personagens (CRUD Admin):**
    * Criação, visualização, atualização e exclusão de personagens.
    * Cadastro do **Documento** de um personagem diretamente no mesmo formulário (relação 1-para-1).
* **Gerenciamento de Cursos (CRUD Admin):**
    * Criação, visualização, atualização e exclusão de cursos.
* **Gerenciamento de Relações (NxN):**
    * Na página de detalhes de um personagem, o admin pode inscrevê-lo em novos cursos.
    * Na mesma página, o admin pode remover inscrições existentes.
    * A página de detalhes de um curso lista todos os personagens inscritos.
* **Interface Responsiva:** Utilização do framework Bootstrap 5 para uma aparência limpa e funcional em diferentes tamanhos de tela.
* **Uso de JavaScript:** A interatividade é aprimorada com o uso do Turbo.js (integrado ao Rails) para criar caixas de diálogo de confirmação (`"Tem certeza?"`) antes de ações destrutivas, como excluir um registro.

---

## Pré-requisitos

Para rodar este projeto localmente, você precisará ter instalado:

* Ruby (versão 3.2.2 ou similar)
* Bundler (`gem install bundler`)
* Node.js e Yarn (para o gerenciamento de assets do Rails)
* Git

---

## Como Rodar a Aplicação

Siga os passos abaixo no seu terminal para configurar e iniciar o projeto:

1.  **Clone o repositório:**
    ```bash
    git clone [https://github.com/ThauanTavares/T5-web.git](https://github.com/ThauanTavares/T5-web.git)
    ```

2.  **Acesse a pasta do projeto:**
    ```bash
    cd T5-web
    ```

3.  **Instale as dependências do Ruby:**
    ```bash
    bundle install
    ```

4.  **Crie e prepare o banco de dados:**
    Este comando irá criar o banco de dados, rodar as migrações para criar as tabelas e popular o banco com dados iniciais (personagens, cursos e o usuário admin).
    ```bash
    rails db:setup
    ```
    *(O comando `db:setup` é um atalho para `db:create`, `db:schema:load` e `db:seed`)*

5.  **Inicie o servidor Rails:**
    ```bash
    bin/dev
    ```

6.  **Acesse a aplicação:**
    Abra seu navegador e visite [**http://localhost:3000**](http://localhost:3000).

---

## Credenciais de Acesso

Para testar as funcionalidades administrativas, utilize o usuário padrão criado pelo `db:seed`:

* **Email:** `yoda@wars.com`
* **Senha:** `masteryoda`

Você também pode se registrar como um novo usuário através do link "Registrar". Novos usuários terão o perfil de "user" por padrão e acesso de apenas leitura.

---

## Tecnologias Utilizadas

* **Backend:** Ruby 3.2.2, Ruby on Rails 7.1
* **Banco de Dados:** SQLite3
* **Autenticação:** Devise
* **Frontend:** HTML, ERB, CSS, Bootstrap 5
* **JavaScript:** Turbo.js (via Importmap)
* **Testes:** Minitest
* **Versionamento:** Git & GitHub

---

**Autor:** Thauan Tavares
