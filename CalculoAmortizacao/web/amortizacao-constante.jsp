<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> ..::POO 03 - Amortização Constante::.. </title>
    </head>
    <body>
    <%@include file="WEB-INF/header.jspf"%>
    <%@include file="WEB-INF/menu.jspf"%>
    
        <h1>Sistema de Amortizacao Constante</h1>
            
        <hr/>
        <%
            double valor = 0.0;
            int periodo = 0;
            double taxa = 0.0;
            double saldoDevedor = 0.0;
            double totalParcelas = 0.0;
            double totalJuros = 0.0;
            double amortizacao = 0.0;
            DecimalFormat decimal = new DecimalFormat("#0.00");
            try {
                    valor = Double.parseDouble(request.getParameter("valor"));
                    periodo = Integer.parseInt(request.getParameter("periodo"));
                    taxa = Double.parseDouble(request.getParameter("taxa"));
                    saldoDevedor = valor;
                } catch (Exception e) {
                }
        %>
        
        <form class="form-horizontal">
            <label for="periodo">Periodo</label>
            <input type="nmber" name="periodo" />
            
            <label for="valor">Valor</label>
            <input type="text" name="valor" />
            
            <label for="taxa">Taxa</label>
            <input type="nmber" name="taxa" />
            
            <button type="submit" name="calcular">Calcular</button>
        </form>
        <br/><br/>
        <table border="1px">
            <tr>
                <th>Mes</th>
                <th>Parcelas</th>
                <th>Amortizações</th>
                <th>Juros</th>
                <th>Saldo Devedor</th>
            </tr>
            <% for (int i = 0; i < periodo; i++) { %>
            <%
                amortizacao =  valor / periodo;
                double parcela = amortizacao + ((taxa / 100) * (valor - i * amortizacao));
                saldoDevedor -= amortizacao;
                totalParcelas += parcela;
                totalJuros += parcela - amortizacao;
            %>
            <tr>
                <td><%= i + 1 %></td>
                <td><%= decimal.format(parcela) %></td>
                <td><%= decimal.format(amortizacao) %></td>
                <td><%= decimal.format(parcela - amortizacao) %></td>
                <td><%=  decimal.format(saldoDevedor) %></td>
            </tr>
            <% } %>
        </table>
        
            <h3>Total parcelas: <%= decimal.format(totalParcelas) %></h3><br/>
            <h3>Total amortizaçao: <%= decimal.format(amortizacao * periodo) %></h3><br/>
            <h3>Total juros: <%= decimal.format(totalJuros) %></h3>
    
    <%@include file="WEB-INF/footer.jspf"%>
    </body>
</html>
