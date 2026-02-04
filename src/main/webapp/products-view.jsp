<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lista de producto</title>
</head>
<body>
<div class="container" id="main-container">
    <h2>Listado de productos (vista productos)</h2>
    <table class = "table table-striped">
        <thead>
        <tr>
            <th>Imagen</th>
            <th>Nombre</th>
            <th>Precio</th>
            <th>Acción</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="product" items='${storeProducts}'>
            <tr>
                <td><img src="<c:out value = '${product.image}' />" alt="<c:out value = '${product.name}' /> "
                    style="width: 100px;"/></td>
                <td><c:out value="${product.name}"/></td>
                <td><c:out value="${product.price}"/> €</td>
                <td>
                    <a href="AddToShoppingCart?product=<c:out value='${product.name}' />">
                        Añadir al carrito
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
