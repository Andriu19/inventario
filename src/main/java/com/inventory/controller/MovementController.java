package com.invertory.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.inventory.dao.MovementDAO;
import com.inventory.dao.ProductDAO;
import com.inventory.model.Movement;
import com.inventory.model.Product;
import com.inventory.model.User;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;


@WebServlet("/movements")
public class MovementController extends HttpServlet {
    private MovementDAO movementDAO = new MovementDAO();
    private ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String type = request.getParameter("type");
        try {
            List<Movement> movements = movementDAO.getMovements(type);
            request.setAttribute("movements", movements);
            request.getRequestDispatcher("/WEB-INF/views/movement.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if ("add".equals(action)) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String movementType = request.getParameter("movementType");

            try {
                List<Product> products = productDAO.getAllProducts();
                Product product = products.stream().filter(p -> p.getProductId() == productId).findFirst().orElse(null);

                if (product != null) {
                    if ("Entry".equals(movementType)) {
                        product.setQuantity(product.getQuantity() + quantity);
                    } else if ("Exit".equals(movementType)) {
                        if (product.getQuantity() >= quantity) {
                            product.setQuantity(product.getQuantity() - quantity);
                        } else {
                            response.sendRedirect("error.jsp?message=Insufficient stock");
                            return;
                        }
                    }

                    productDAO.updateProduct(product);

                    Movement movement = new Movement();
                    movement.setProductId(productId);
                    movement.setMovementType(movementType);
                    movement.setQuantity(quantity);
                    movement.setPerformedBy(user.getUsername());

                    movementDAO.addMovement(movement);
                    response.sendRedirect("movements");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                response.sendRedirect("error.jsp");
            }
        }
    }
}

