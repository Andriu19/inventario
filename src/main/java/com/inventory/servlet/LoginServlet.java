package com.inventory.servlet;

import com.inventory.service.UserService;
import com.inventory.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private UserService userService;

    @Override
    public void init() throws ServletException {
        super.init();
        userService = new UserService(); // Asegúrate de que UserService esté correctamente inicializado
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username == null || password == null) {
            response.sendRedirect("login.jsp?error=Invalid credentials");
            return;
        }

        User user = userService.getUserByUsername(username);

        if (user != null && user.getPassword().equals(password)) {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("role", user.getRole()); // Guarda el rol del usuario en la sesión
            response.sendRedirect("inventory.jsp"); // Redirige a la página de inventario
        } else {
            response.sendRedirect("login.jsp?error=Invalid credentials");
        }
    }
}
