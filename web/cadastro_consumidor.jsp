
<%-- 
    Document   : cadastroconsumidor
    Created on : 15 de jun. de 2023
    Author     : Pedro Ventola 
--%>

<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="java.text.*" import="java.lang.*" import="java.sql.*" import="java.util.Date"%>
<%@page import="controles.Consumidor" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <title>Cadastro de Consumidor</title>
         <!-- Estilização -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=PT+Sans&display=swap">
        <style>
             body {background-color: #E0DDD7;
                  font-family: 'PT Sans', sans-serif;}
        </style>
    </head>
    <body>
        <h1>Consumidores</h1>
        
       <% /*-- Entrada --*/
        String nome = request.getParameter("nome");
        String cpf = request.getParameter("cpf");
        String telefone = request.getParameter("telefone");
        String endereco = request.getParameter("endereco");
        String email = request.getParameter("email");
        
        Consumidor cons = new Consumidor (nome, cpf, telefone, endereco, email);
        
        /*-- Saída --*/
        out.println("<b>Registro do Consumidor</b>");
        out.println("<br> Nome......: " + cons.getNome());
        out.println("<br> CPF.......: " + cons.getCpf());
        out.println("<br> Telefone..: " + cons.getTelefone());
        out.println("<br> Endereço..: " + cons.getEndereco());
        out.println("<br> Email..: " + cons.getEmail());
         

         try{
                Class.forName("com.mysql.cj.jdbc.Driver"); // Driver para MySQL -- Registra a Dll
                String url = "jdbc:mysql://localhost:3306/reserveats"; // Determina o servidor e banco(DB)
                Connection conexao = DriverManager.getConnection(url, "root", "");           

                Statement stmt = conexao.createStatement(); // Criar uma instrução com base na conexão. 
                
                /*-- "INSERT INTO consumidor(nome, cpf, telefone, endereco, email) VALUES ('Agnaldo', '12345678912', '1199999999', 'Rua Macambira, 66', 'ag123@hotmail.com')" --*/
                String sql = "INSERT INTO consumidor(nome, cpf, telefone, endereco) VALUES ('" + cons.getNome() + "', " + cons.getCpf() + ", '" +  cons.getTelefone() + "', '" + cons.getEndereco() + "', '" + cons.getEmail() + "')"; 
           
           stmt.executeUpdate(sql);
                stmt.close();
                
                out.println("<br><br> <b>Cadastro feito com sucesso! </b>");
            } catch (Exception ex) {
                out.println("<br> Erro:" + ex);
            }
           
       %>
       
        <br><br>
        <button onclick="document.location='index.html'"> Início</button>
    </body>
</html>
