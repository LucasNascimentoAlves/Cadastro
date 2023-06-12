<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>

<%
    String URL = "jdbc:postgresql://localhost:5432/teste";
    String Username = "postgres";
    String Password = "postgres";
    
    try {
        Connection connection = DriverManager.getConnection(URL, Username, Password);
        out.println("Connected to server");

        // Tabela "estudantes"
        String sqlEstudantes = "SELECT * FROM estudantes";
        Statement statementEstudantes = connection.createStatement();
        ResultSet resultEstudantes = statementEstudantes.executeQuery(sqlEstudantes);
%>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="estilo.css">
    <title>Imprimir Dados do Banco</title>
</head>
<body>
    <h1>Dados do Banco</h1>
    <h2>Tabela Estudantes</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Matrícula</th>
            <th>Nome Completo</th>
            <th>Email</th>
            <th>Ano de Egresso</th>
        </tr>
        <%
            while (resultEstudantes.next()) {
                int id = resultEstudantes.getInt("id");
                String matricula = resultEstudantes.getString("matricula");
                String nomeCompleto = resultEstudantes.getString("nome_completo");
                String email = resultEstudantes.getString("email");
                int anoEgresso = resultEstudantes.getInt("ano_egresso");
        %>
        <tr>
            <td><%= id %></td>
            <td><%= matricula %></td>
            <td><%= nomeCompleto %></td>
            <td><%= email %></td>
            <td><%= anoEgresso %></td>
        </tr>
        <%
            }
            resultEstudantes.close();
            statementEstudantes.close();
        %>
    </table>

    <%  
        // Tabela "professores"
        String sqlProfessores = "SELECT * FROM professores";
        Statement statementProfessores = connection.createStatement();
        ResultSet resultProfessores = statementProfessores.executeQuery(sqlProfessores);
    %>
    
    <h2>Tabela Professores</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Matrícula</th>
            <th>Nome Completo</th>
            <th>Email</th>
            <th>Ano de Egresso</th>
        </tr>
        <%
            while (resultProfessores.next()) {
                int id = resultProfessores.getInt("id");
                String matricula = resultProfessores.getString("matricula");
                String nomeCompleto = resultProfessores.getString("nome_completo");
                String email = resultProfessores.getString("email");
                int anoEgresso = resultProfessores.getInt("ano_egresso");
        %>
        <tr>
            <td><%= id %></td>
            <td><%= matricula %></td>
            <td><%= nomeCompleto %></td>
            <td><%= email %></td>
            <td><%= anoEgresso %></td>
        </tr>
        <%
            }
            resultProfessores.close();
            statementProfessores.close();
        %>
    </table>

    <%  
        // Tabela "disciplinas"
        String sqlDisciplinas = "SELECT * FROM disciplinas";
        Statement statementDisciplinas = connection.createStatement();
        ResultSet resultDisciplinas = statementDisciplinas.executeQuery(sqlDisciplinas);
    %>
    
    <h2>Tabela Disciplinas</h2>
    <table>
        <tr>
            <th>Código da Disciplina</th>
            <th>Nome</th>
            <th>ID do Professor</th>
        </tr>
        <%
            while (resultDisciplinas.next()) {
                String codigoDisciplina = resultDisciplinas.getString("codigo_disciplina");
                String nome = resultDisciplinas.getString("nome");
                int idProfessor = resultDisciplinas.getInt("id_professor");
        %>
        <tr>
            <td><%= codigoDisciplina %></td>
            <td><%= nome %></td>
            <td><%= idProfessor %></td>
        </tr>
        <%
            }
            resultDisciplinas.close();
            statementDisciplinas.close();
        %>
    </table>

    <%  
        // Tabela "matriculas"
        String sqlMatriculas = "SELECT * FROM matriculas";
        Statement statementMatriculas = connection.createStatement();
        ResultSet resultMatriculas = statementMatriculas.executeQuery(sqlMatriculas);
    %>
    
    <h2>Tabela Matrículas</h2>
    <table>
        <tr>
            <th>ID do Estudante</th>
            <th>Código da Disciplina</th>
        </tr>
        <%
            while (resultMatriculas.next()) {
                int idEstudante = resultMatriculas.getInt("id_estudante");
                String codigoDisciplina = resultMatriculas.getString("codigo_disciplina");
        %>
        <tr>
            <td><%= idEstudante %></td>
            <td><%= codigoDisciplina %></td>
        </tr>
        <%
            }
            resultMatriculas.close();
            statementMatriculas.close();
        %>
    </table>
</body>
</html>

<%
            connection.close();
        } catch (SQLException e) {
            out.println("Error in connecting to PostgreSQL server");
            e.printStackTrace();
        }
        %>
