<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 100%;
            max-width: 400px; /* Limita el ancho del contenedor */
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        a {
            display: block; /* Hace que los enlaces sean bloques para que ocupen toda la línea */
            margin: 10px 0;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Welcome to the Inventory System</h2>
        <a href="/inventory-system/views/login.jsp">Logout</a>
        <a href="/inventory-system/views/inventory.jsp">Inventory</a>
        <a href="/inventory-system/views/movement.jsp">Movements</a>
        <a href="/inventory-system/views/history.jsp">History</a>
    </div>
</body>
</html>
