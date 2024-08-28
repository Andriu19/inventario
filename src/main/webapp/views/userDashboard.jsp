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
                <!-- Provide functionality for managing inventory -->
                <h3>Manage Inventory</h3>
                <form action="inventory" method="post">
                    <label>Product Name:</label>
                    <input type="text" name="productName"/>
                    <label>Quantity:</label>
                    <input type="number" name="quantity"/>
                    <label>Status:</label>
                    <input type="text" name="status"/>
                    <button type="submit" name="action" value="add">Add Product</button>
                </form>
                <h3>Inventory List</h3>
                <table>
                    <tr>
                        <th>Product ID</th>
                        <th>Product Name</th>
                        <th>Quantity</th>
                        <th>Status</th>
                    </tr>
                    <% 
                        List<Product> products = (List<Product>) request.getAttribute("products");
                        if (products != null && !products.isEmpty()) {
                            for (Product product : products) { 
                    %>
                    <tr>
                        <td><%= product.getProductId() %></td>
                        <td><%= product.getProductName() %></td>
                        <td><%= product.getQuantity() %></td>
                        <td><%= product.getStatus() %></td>
                    </tr>
                    <% 
                        } 
                    } else { 
                    %>
                    <tr>
                        <td colspan="4">No products found.</td>
                    </tr>
                    <% 
                    } 
                    %>
                </table>
            <% } else { %>
                <!-- Default content for other roles -->
                <p>Access Denied</p>
            <% } %>
<%
        } else {
            response.sendRedirect("login.jsp");
        }
    }
%>
