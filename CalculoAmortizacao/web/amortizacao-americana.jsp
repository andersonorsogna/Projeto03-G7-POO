
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> ..::POO 03 - Amortização Americana::.. </title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf"%>
        <h1>Amortização Americana</h1>
         <hr/>
         <%
             int p=10;
             try{p = Integer.parseInt(request.getParameter("p"));}
             catch(Exception e){}
             int v=0;
             try{v = Integer.parseInt(request.getParameter("v"));}
             catch(Exception e){}
             int j=0;
             try{j = Integer.parseInt(request.getParameter("j"));}
             catch(Exception e){}
         %>
         <form>
         <table>
             <tr>
                 <td>Período(meses): </td>
                 <td><input type="number" name="p" value="<%=p%>"/></td>
             </tr>
             <tr>
                 <td>Valor(R$): </td>
                 <td><input type="number" name="v" value="<%=v%>"/></td>
             </tr>
             <tr>
                 <td>Juros(%a.m.): </td>
                 <td><input type="number" name="j" value="<%=j%>"/><td>
             </tr>
             <tr>
                 <td><input type="submit" value="Gerar"/></td>
                 <td><input type="reset" value="Limpar"/></td>
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
    <%@include file="WEB-INF/jspf/footer.jspf"%>
    </body>
</html>
