<%-- 
    Document   : consultar_pedido
    Created on : 16 de jun. de 2023, 20:52:40
    Author     : Gabriel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.*" import="java.lang.*" import="java.sql.*" import="java.util.Date"%>
<%@page import="controles.Pedido" %>
<%@ page import="java.util.Random" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <title>Consulta de pedido</title>
            <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
        }

    </style>
    </head>
      <body>
        <h1>Consulta de pedido:</h1>
        <%
            /*-- Entrada --*/
            String codParam = request.getParameter("cod");
            int cod = Integer.parseInt(codParam);
        

            /*-- Consulta --*/                         
            try{
                Class.forName("com.mysql.cj.jdbc.Driver"); // Driver para MySQL -- Registra a Dll
                String url = "jdbc:mysql://localhost:3306/reserveats"; // Determina o servidor e banco(DB)
                Connection conexao = DriverManager.getConnection(url, "root", "");           

                Statement stmt = conexao.createStatement(); // Criar uma instrução com base na conexão. 
                
                /*-- "SELECT * FROM pedido WHERE pk_id_consumidor LIKE '%de%'" --*/
                String sql = "SELECT * FROM pedido WHERE cod LIKE '%" + cod + "%'";       
                
                ResultSet rs = stmt.executeQuery(sql);
                while (rs.next()) {
                    out.println("<br> Pedido: " + rs.getString("cod"));
                    out.println("<br> Nome: " + rs.getString("nome"));
                    out.println("<br> Endereço: " + rs.getString("endereco"));
                    out.println("<br> Bairro: " + rs.getString("bairro"));
                    out.println("<br> Comida: " + rs.getString("comida"));
                    out.println("<br> Observações: " + rs.getString("observacoes"));
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
