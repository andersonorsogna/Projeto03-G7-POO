
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
         <hr>
         <%
             int t=10;
             int v=0;
             int i=0;
             try{
                 t = Integer.parseInt(request.getParameter("t"));
                 v = Integer.parseInt(request.getParameter("v"));
                 i = Integer.parseInt(request.getParameter("i"));}
             catch(Exception e){}
         %>
         <form>
         <table>
             <tr>
                 <td>Período (em meses): </td>
                 <td><input type="number" name="t" value="<%=t%>"/></td>
             </tr>
             <tr>
                 <td>Valor (em R$): </td>
                 <td><input type="number" name="v" value="<%=v%>" step="0.01"/></td>
             </tr>
             <tr>
                 <td>Juros (%a.m.): </td>
                 <td><input type="number" name="i" value="<%=i%>" step="0.01"/><td>
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
             <%for(int x=0; x<=t; x++){%>
             <tr>
                 <td><%=x%></td>
                 <%if(x==t){
                 out.println("<td>"+v+"</td>");
                 }
                 else{
                 out.println("<td>"+0+"</td>");
                 }%>
                 <%if(x!=0){
                 out.println("<td>"+v*i*0.01+"</td>");
                 }
                 else{
                 out.println("<td>"+0+"</td>");
                 }%>
                 <%if(x==t){
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
                 <td>Total de juros </td>
                 <td>Valor a pagar </td>
             </tr>
             <th style="color: #ff0000">R$ <%=t*v*i*0.01%></th>
             <th style="color: #ff0000">R$ <%=(t*v*i*0.01)+v%></th>
         </table>
         </div>
    <%@include file="WEB-INF/footer.jspf"%>
    </body>
</html>
