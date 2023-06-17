<%-- 
    Document   : consultar_dados
    Author     : Pedro Ventola
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.*" import="java.lang.*" import="java.sql.*" import="java.util.Date"%>
<%@page import="controles.Consumidor" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <title>Consultar Dados</title>
         <!-- Estilização -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=PT+Sans&display=swap">
        <style>
             body {background-color: #E0DDD7;
                  font-family: 'PT Sans', sans-serif;}
        </style>
    </head>
    <body>
        <h1>Consulta de Dados do Consumidor</h1>
        <%
            /*-- Entrada --*/
            String cpf = request.getParameter("cpf");           

            /*-- Consulta --*/                         
            try{
                Class.forName("com.mysql.cj.jdbc.Driver"); // Driver para MySQL -- Registra a Dll
                String url = "jdbc:mysql://localhost:3306/reserveats"; // Determina o servidor e banco(DB)
                Connection conexao = DriverManager.getConnection(url, "root", "");           

                Statement stmt = conexao.createStatement(); // Criar uma instrução com base na conexão. 
                
                
                String sql = "SELECT * FROM consumidor WHERE cpf LIKE '%" + cpf + "%'";       
                
                ResultSet rs = stmt.executeQuery(sql);
                while (rs.next()) {
                    out.println("<br> Dados(s): " + rs.getRow());
                    out.println("<br> Nome: " + rs.getString("nome"));
                    out.println("<br> CPF: " + rs.getString("cpf"));
                    out.println("<br> Telefone: " + rs.getString("telefone"));
                    out.println("<br> Endereço..: " + rs.getString("endereco"));
                    
                    
                }                          
                stmt.close();                
                
            } catch (Exception ex) {
                out.println("<br> Erro:" + ex);
            }
        %>    
        <br><br>
        <button onclick="document.location='index.html'"> Início</button>
      </body>
</html>