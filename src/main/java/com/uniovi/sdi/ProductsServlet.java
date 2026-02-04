package com.uniovi.sdi;

import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import java.util.List;
import java.io.IOException;

@WebServlet(name = "ProductServlet", value = "/products")
public class ProductsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> storeProducts = new ProductsService().getProducts();
        request.setAttribute("storeProducts", storeProducts);
        getServletContext().getRequestDispatcher("/products-view.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
