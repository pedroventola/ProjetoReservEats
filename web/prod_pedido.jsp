<%-- 
@author: Gabriel Victor da Gama
--%>

<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="java.text.*" import="java.lang.*" import="java.sql.*" import="java.util.Date"%>
<%@page import="controles.Pedido" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <title>Faça já seu pedido!</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=PT+Sans&display=swap">
        
        <style>
             body {background-color: #E0DDD7;
                  font-family: 'PT Sans', sans-serif;}
        </style> 
    </head>
    <body>
        <h1>Pedido de Comida</h1>
        <%
            /*-- Entrada --*/
            String nome = request.getParameter("nome_ped");
            String endereco = request.getParameter("endereco_ped");
            String bairro = request.getParameter("bairro");
            String comida = request.getParameter("comida");
            String obs = request.getParameter("obs");

            /*-- Processamento --*/
            Pedido ped = new Pedido(0, nome, endereco, bairro, comida, obs);

            /*-- Saída --*/
            out.println("<b>Registro [Pedido]:</b>");
            out.println("<br> Cod......: " + ped.getCod());
            out.println("<br> Nome.........: " + ped.getNome());
            out.println("<br> Endereço.....: " + ped.getEnd());
            out.println("<br> Bairro.......: " + ped.getBairro());
            out.println("<br> Comida.......: " + ped.getComida());
            out.println("<br> Observações..: " + ped.getObs());
            

            /*-- Gravação --*/                         
            try{
                Class.forName("com.mysql.cj.jdbc.Driver"); // Driver para MySQL -- Registra a Dll
                String url = "jdbc:mysql://localhost:3306/reserveats"; // Determina o servidor e banco(DB)
                Connection conexao = DriverManager.getConnection(url, "root", "");           

                Statement stmt = conexao.createStatement(); // Criar uma instrução com base na conexão. 
                
                /*-- "INSERT INTO pedido(nome, endereco, bairro, comida, observacoes) VALUES ('Agnaldo', 'Rua Militones', 'Motta', 'Pizza', 'Sem picles')" --*/
                String sql = "INSERT INTO pedido(nome, endereco, bairro, comida, observacoes) VALUES ('" + 
                ped.getNome() + "', '" + ped.getEnd() + "', '" +  ped.getBairro() + "', '" + ped.getComida() +
                "', '" + ped.getObs() + "')";
                
                /*-- out.println("<br> <br>SQL: " + sql); --*/
                stmt.executeUpdate(sql);
                stmt.close();
                
                out.println("<br> Registro inserido com sucesso!");
            } catch (Exception ex) {
                out.println("<br> Erro:" + ex);
            }
        %>   
        <br><br>
        <button onclick="document.location='index.html'"> Início</button>
    </body>
</html>
