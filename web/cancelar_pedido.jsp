<%-- 
    Document   : cancelar_pedido
    Created on : 16 de jun. de 2023
    Author     : Pedro Ventola 
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.*" import="java.lang.*" import="java.sql.*" import="java.util.Date"%>
<%@page import="controles.Pedido" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <title>Cancelar Pedidos</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=PT+Sans&display=swap">
        <style>
             body {background-color: #E0DDD7;
                  font-family: 'PT Sans', sans-serif;}
        </style> 
    </head>
    <body>
        <h1>Cancele seu Pedido!</h1>
        <%
            request.setCharacterEncoding("UTF-8");  // Muda o Encoding para UTF-8 na requisição.
            
            /*-- Entrada --*/
            String cod = request.getParameter("cod"); //Recebendo do .html

            /*-- DB --*/                         
            try{
                Class.forName("com.mysql.cj.jdbc.Driver"); // Driver para MySQL -- Registra a Dll
                String url = "jdbc:mysql://localhost:3306/reserveats"; // Determina o servidor e banco(DB)
                Connection conexao = DriverManager.getConnection(url, "root", "");           

                Statement stmt = conexao.createStatement(); // Criar uma instrução com base na conexão. 
                
               
                String sql = "DELETE FROM pedido WHERE pk_id_consumidor = " + cod;            
                
               
                int i = stmt.executeUpdate(sql);
                
                if (i>0){
                    out.println("<br> Pedido excluido com sucesso!");                    
                }else{
                    out.println("<br> Erro na instrução!");
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
