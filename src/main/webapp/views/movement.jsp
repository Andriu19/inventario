<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.inventory.model.Movement" %>
<!DOCTYPE html>
<html>
<head>
    <title>Movements</title>
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
            max-width: 600px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #555;
        }

        input[type="number"],
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
            display: block;
            margin: 0 auto;
        }

        button:hover {
            background-color: #218838;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: #fff;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        td[colspan="6"] {
            text-align: center;
            color: #888;
        }
    </style>
</head>
<body>
    <h2>Movements</h2>
    <form action="movements" method="post">
        <label>Product ID:</label>
        <input type="number" name="productId"/>
        <label>Quantity:</label>
        <input type="number" name="quantity"/>
        <label>Movement Type:</label>
        <select name="movementType">
            <option value="Entry">Entry</option>
            <option value="Exit">Exit</option>
        </select>
        <button type="submit" name="action" value="add">Add Movement</button>
    </form>

    <h3>Movement List</h3>
    <table>
        <tr>
            <th>Movement ID</th>
            <th>Product ID</th>
            <th>Movement Type</th>
            <th>Quantity</th>
            <th>Date</th>
            <th>Performed By</th>
        </tr>
        <% 
            List<Movement> movements = (List<Movement>) request.getAttribute("movements");
            if (movements != null && !movements.isEmpty()) {
                for (Movement movement : movements) { 
        %>
            <tr>
                <td><%= movement.getMovementId() %></td>
                <td><%= movement.getProductId() %></td>
                <td><%= movement.getMovementType() %></td>
                <td><%= movement.getQuantity() %></td>
                <td><%= movement.getMovementDate() %></td>
                <td><%= movement.getPerformedBy() %></td>
            </tr>
        <% 
            } 
        } else { 
        %>
            <tr>
                <td colspan="6">No movements found.</td>
            </tr>
        <% 
        } 
        %>
    </table>
</body>
</html>
