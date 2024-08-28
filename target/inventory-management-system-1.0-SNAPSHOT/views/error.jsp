<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Error</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8d7da;
            color: #721c24;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            min-height: 100vh;
            margin: 0;
            padding: 20px;
        }

        h2 {
            color: #721c24;
        }

        p {
            background-color: #f5c6cb;
            border: 1px solid #f1b0b7;
            padding: 15px;
            border-radius: 5px;
            max-width: 600px;
            text-align: center;
        }

        a {
            color: #004085;
            text-decoration: none;
            font-weight: bold;
            margin-top: 20px;
            display: inline-block;
            padding: 10px 20px;
            border: 1px solid #004085;
            border-radius: 5px;
            background-color: #cce5ff;
        }

        a:hover {
            background-color: #004085;
            color: #fff;
        }
    </style>
</head>
<body>
    <h2>Error</h2>
    <p><%= request.getParameter("message") %></p>
    <a href="index.jsp">Return to home</a>
</body>
</html>
