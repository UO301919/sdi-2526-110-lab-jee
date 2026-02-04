package com.uniovi.sdi;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "DeleteFromShopingCartServlet", value = "/DeleteFromShopingCart")
public class DeleteFromShopingCartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        HashMap<String, Integer> cart =
                (HashMap<String, Integer>) session.getAttribute("cart");
        if (cart == null) {
            cart = new HashMap<String, Integer>();
            session.setAttribute("cart", cart);
        }
        String product = request.getParameter("product");
        String method = request.getParameter("_method");
        if (product != null && "DELETE".equalsIgnoreCase(method)) {
            removeFromShoppingCart(cart, product);
        }
        request.setAttribute("selectedItems", cart);
        getServletContext().getRequestDispatcher("/cart.jsp").forward(request, response);
    }

    private void removeFromShoppingCart(Map<String, Integer> cart, String productKey) {
        if(cart.get(productKey) != null) {
            int productCount = cart.get(productKey);
            if(productCount <= 1) {
                cart.remove(productKey);
            } else {
                cart.put(productKey, productCount - 1);
            }
        }
    }
}
