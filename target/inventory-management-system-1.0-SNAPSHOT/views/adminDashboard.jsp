<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="com.inventory.service.UserService" %>
<%@ page import="com.inventory.model.User" %>

<%
    HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    } else {
        String username = (String) session.getAttribute("username");
        UserService userService = new UserService();
        User user = userService.getUserByUsername(username);

        if (user != null) {
            String role = user.getRole();
%>
            <h2>Welcome, <%= username %></h2>
            <h3>Role: <%= role %></h3>
            <!-- Display content based on user role -->
            <% if ("Admin".equals(role)) { %>
                <!-- Admin content -->
                <p>Admin Dashboard</p>
            <% } else if ("Almacenista".equals(role)) { %>
                <!-- Almacenista content -->
                <p>Almacenista Dashboard</p>
            <% } else { %>
                <!-- Default content -->
                <p>Access Denied</p>
            <% } %>
<%
        } else {
            response.sendRedirect("login.jsp");
        }
    }
%>
