<%@ page import="br.ucsal.edu.CadastroDAO" %>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="estilo.css">
    <script>
        function exibirFormulario(tipo) {
            var formularios = document.getElementsByClassName("formulario");
            for (var i = 0; i < formularios.length; i++) {
                formularios[i].style.display = "none";
            }
            document.getElementById(tipo).style.display = "block";
        }

        function exibirAlerta() {
            alert("Cadastro realizado com sucesso!");
        }
    </script>
</head>
<body>
    <h1>Cadastro</h1>
    
    <button onclick="exibirFormulario('estudante')">Cadastrar estudante</button>
    <button onclick="exibirFormulario('professor')">Cadastrar professor</button>
    <button onclick="exibirFormulario('disciplina')">Cadastrar disciplina</button>
    <button onclick="exibirFormulario('matricula')">Matrícula</button>
     
    <form id="estudante" class="formulario" action="cadastro.jsp" method="post" style="display: none;" onsubmit="exibirAlerta()">
        <fieldset>
            <legend>Cadastrar Estudante no curso</legend>
            <label>ID/Matrícula:</label>
            <input type="text" name="estudante_id" required>
            <br>
            <label>Nome completo:</label>
            <input type="text" name="estudante_nome" required>
            <br>
            <label>Email:</label>
            <input type="email" name="estudante_email" required>
            <br>
            <label>Ano de egresso:</label>
            <input type="number" name="estudante_ano_egresso" required>
        </fieldset>
        <br>
        <input type="submit" value="Cadastrar Estudante">
    </form>
    
    <form id="professor" class="formulario" action="cadastro.jsp" method="post" style="display: none;" onsubmit="exibirAlerta()">
        <fieldset>
            <legend>Cadastrar Professor no curso</legend>
            <label>ID/Matrícula:</label>
            <input type="text" name="professor_id" required>
            <br>
            <label>Nome completo:</label>
            <input type="text" name="professor_nome" required>
            <br>
            <label>Email:</label>
            <input type="email" name="professor_email" required>
            <br>
            <label>Ano de egresso:</label>
            <input type="number" name="professor_ano_egresso" required>
        </fieldset>
        <br>
        <input type="submit" value="Cadastrar Professor">
    </form>
    
    <form id="disciplina" class="formulario" action="cadastro.jsp" method="post" style="display: none;" onsubmit="exibirAlerta()">
        <fieldset>
            <legend>Cadastrar Disciplina no curso</legend>
            <label>Código da disciplina:</label>
            <input type="text" name="disciplina_codigo" required>
            <br>
            <label>Nome:</label>
            <input type="text" name="disciplina_nome" required>
            <br>
            <label>Professor:</label>
            <input type="text" name="disciplina_professor" required>
        </fieldset>
        <br>
        <input type="submit" value="Cadastrar Disciplina">
    </form>
    
    <form id="matricula" class="formulario" action="cadastro.jsp" method="post" style="display: none;" onsubmit="exibirAlerta()">
        <fieldset>
            <legend>Matricular Estudantes na disciplina</legend>
            <label>Código da disciplina:</label>
            <input type="text" name="matricula_disciplina" required>
            <br>
            <label>Código do estudante:</label>
            <input type="text" name="matricula_estudante" required>
        </fieldset>
        <br>
        <input type="submit" value="Matricular Estudante">
    </form>
    
   <%
        CadastroDAO dao = new CadastroDAO();

        if (request.getParameter("estudante_id") != null) {
            String matricula = request.getParameter("estudante_id");
            String nomeCompleto = request.getParameter("estudante_nome");
            String email = request.getParameter("estudante_email");
            int anoEgresso = Integer.parseInt(request.getParameter("estudante_ano_egresso"));

            dao.inserirEstudante(matricula, nomeCompleto, email, anoEgresso);
        } else if (request.getParameter("professor_id") != null) {
            String matricula = request.getParameter("professor_id");
            String nomeCompleto = request.getParameter("professor_nome");
            String email = request.getParameter("professor_email");
            int anoEgresso = Integer.parseInt(request.getParameter("professor_ano_egresso"));

            dao.inserirProfessor(matricula, nomeCompleto, email, anoEgresso);
        } else if (request.getParameter("disciplina_codigo") != null) {
            String codigoDisciplina = request.getParameter("disciplina_codigo");
            String nome = request.getParameter("disciplina_nome");
            int idProfessor = Integer.parseInt(request.getParameter("disciplina_professor"));

            dao.inserirDisciplina(codigoDisciplina, nome, idProfessor);
        } else if (request.getParameter("matricula_disciplina") != null) {
            int idEstudante = Integer.parseInt(request.getParameter("matricula_estudante"));
            String codigoDisciplina = request.getParameter("matricula_disciplina");

            dao.realizarMatricula(idEstudante, codigoDisciplina);
        }
    %>
    
</body>
</html>
