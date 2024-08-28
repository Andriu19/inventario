<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            min-height: 100vh;
        }

        h2 {
            color: #333;
        }

        form {
            margin-bottom: 20px;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px; /* Limita el ancho del formulario */
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #555;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        button {
            background-color: #28a745;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            display: block; /* Asegura que el botón sea un bloque */
            margin: 0 auto; /* Centra el botón horizontalmente */
        }

        button:hover {
            background-color: #218838;
        }

        .message {
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>
    <h2>Register</h2>
    <form action="register" method="post">
        <div class="form-group">
            <label>Username:</label>
            <input type="text" name="username" required/>
        </div>
        <div class="form-group">
            <label>Email:</label>
            <input type="email" name="email" required/>
        </div>
        <div class="form-group">
            <label>Password:</label>
            <input type="password" name="password" required/>
        </div>
        <div class="form-group">
            <label>Role:</label>
            <select name="role">
                <option value="Administrator">Administrator</option>
                <option value="Warehouse Keeper">Almacenista</option>
            </select>
        </div>
        <button type="submit" name="action" value="register">Register</button>
    </form>
    <% if (request.getParameter("error") != null) { %>
        <p class="message"><%= request.getParameter("error") %></p>
    <% } %>
</body>
</html>
