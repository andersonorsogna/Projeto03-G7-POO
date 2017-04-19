<%-- 
    Document   : amortizacao-constante
    Created on : 19/04/2017, 01:24:13
    Author     : Aline
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> ..::POO 03 - Amortização Americana::.. </title>
    </head>
    <body>
        <%@include file="WEB-INF/menu.jspf"%>
        <h1>Amortização Americana</h1>
         <hr/>
         <%
             int p=10;
             int v=0;
             int j=0;
             try{
                 p = Integer.parseInt(request.getParameter("p"));
                 v = Integer.parseInt(request.getParameter("v"));
                 j = Integer.parseInt(request.getParameter("j"));}
             catch(Exception e){}
         %>
         <form>
         <table>
             <tr>
                 <td>Período (em meses): </td>
                 <td><input type="number" name="p" value="<%=p%>"/></td>
             </tr>
             <tr>
                 <td>Valor (em R$): </td>
                 <td><input type="number" name="v" value="<%=v%>"/></td>
             </tr>
             <tr>
                 <td>Juros (%a.m.): </td>
                 <td><input type="number" name="j" value="<%=j%>"/><td>
             </tr>
             <tr>
                 <td colspan="2"><input type="submit" value="Calcular"/></td>
             </tr>
         </table>
         </form>
         <hr/>
         <table border="1px">
             <tr>
                 <td> Mês </td>
                 <td> Amortização (R$) </td>
                 <td> Juros (R$) </td>
                 <td> Dívida (R$) </td>
             </tr>
             <%for(int i=0; i<=p; i++){%>
             <tr>
                 <td><%=i%></td>
                 <%if(i==p){
                 out.println("<td>"+v+"</td>");
                 }
                 else{
                 out.println("<td>"+0+"</td>");
                 }%>
                 <%if(i!=0){
                 out.println("<td>"+v*j*0.01+"</td>");
                 }
                 else{
                 out.println("<td>"+0+"</td>");
                 }%>
                 <%if(i==p){
                 out.println("<td>"+0+"</td>");
                 }
                 else{
                 out.println("<td>"+v+"</td>");
                 }%>
             </tr>
             <%}%>
         </table>
             <br/>
         <table>
             <tr>
                 <td>O total de juros é de </td>
                 <th>R$ <%=p*v*j*0.01%></th>
             </tr>
                 <td>O total a pagar é de</td>
                 <th>R$ <%=(p*v*j*0.01)+v%></th>
         </table>
         </div>
    <%@include file="WEB-INF/footer.jspf"%>
    </body>
</html>
