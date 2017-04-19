
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> ..::Tabela - Price::.. </title>
    </head>
    <body>
    <%@include file="WEB-INF/menu.jspf"%>
    <h1>Tabela Price</h1>
         <hr>
        <%
            double cap = 0;
            double taxa = 0;
            double dev = 0;
            double amorti = 0;
            double prest = 0;
            int meses = 0;
            
            try{cap = Double.parseDouble(request.getParameter("capi"));}
            catch(Exception e){}
            try{taxa = Double.parseDouble(request.getParameter("tax"));}
            catch(Exception e){}
            try{meses = Integer.parseInt(request.getParameter("mes"));}
            catch(Exception e){}

            taxa = taxa/100;
            double l1 = cap * taxa;
            double a = Math.pow((1+taxa),meses);
            double l2 = 1-(1/a);
                                    
            %>
            <form> 
                <label for="capi"><b>Capital</b></label><br>
                <input type="text" name="capi" id="cap">
                <br>
                <label for="mes"><b>Meses</b></label><br>
                <input type="text" name="mes" id="mes">
                <br>
                <label for="tax"><b>Juros</b></label><br>
                <input type="text" name="tax" id="tax">
                
                <br>
                <input type="submit" value="gerar">
                <br/>
            </form>
            <hr>
            <%if(cap > 0 && meses>0 && taxa>0){%>
            <table border="1">
                <th>Parcelas</th>
                    <th>Saldo Devedor</th>
                    <th>Valor da Prestação</th>
                    <th>Valor dos Juros</th>
                    <th>Amortização</th>
                    
                <%for(int i = 1; i <= meses; i++){
                    
                    double juros = 0;
                    
                    if(i == 1){
                        dev = cap;
                        prest = 0;
                        juros = 0;
                        amorti = 0;
                    }
                    else{
                        prest = l1/l2;
                        juros = dev * taxa;
                        dev = (dev+juros)- prest;
                        amorti = prest - juros;
                    }                   
                %>                
                <tr>
                    <td><%=i%></td>
                    <td><%=dev%></td>
                    <td><%=prest%></td>
                    <td><%=juros%></td>
                    <td><%=amorti%></td>
                </tr>
                <%}%>
            </table><%}%>
    <%@include file="WEB-INF/footer.jspf"%>
    </body>
</html>
