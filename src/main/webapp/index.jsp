<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8"%>
<%@ page language="java" import="com.uniovi.sdi.* , java.util.List"%>
<html lang="en">
<head>
    <title>Servlets</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
            crossorigin="anonymous"></script>
</head>
<body>

<%
    Integer counter = (Integer) application.getAttribute("counter");
    if (counter == null) {
        counter = 0;
    }
    application.setAttribute("counter", counter + 1);
%>

<!-- Barra de Navegación superior -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="collapse navbar-collapse" id="my-navbarColor02">
        <ul class="navbar-nav me-auto">
            <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="AddToShoppingCart">
                    Carrito
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="login.jsp">Login</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="admin.jsp">Administrar productos</a>
            </li>
        </ul>
        <div class="text-white ms-auto">
            <%=counter%> Visitas
        </div>
    </div>
</nav>

<!-- Contenido -->
<div class="container" id="main-container">
    <h2>Productos</h2>
    <div class="row ">
        <%
            List<Product> listProducts = new ProductsService().getProducts();
            for(Product product : listProducts){
        %>
        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
            <div>
                <img src="<%=product.getImage() %>" alt="" />
                <div><%=product.getName() %></div>
                <a href="AddToShoppingCart?product=<%=product.getName() %>" class="btn btn-default" >
                    <%=product.getPrice() %> €
                </a>
            </div>
        </div>
        <%
            }
        %>
    </div>
</div>
</body>
</html>
