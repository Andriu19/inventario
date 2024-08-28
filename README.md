# Inventory Management System

## Descripción

Este es un sistema web de gestión de inventario para empresas, construido con Java utilizando el patrón de diseño MVC y SQL Server como base de datos.

## Características

- Inicio de sesión.
- Módulo para ver y gestionar el inventario.
- Módulo para entradas y salidas de productos.
- Historial de movimientos.
- Roles: Administrador y Almacenista con permisos específicos.

## Requisitos

- Java 8 o superior.
- Apache Tomcat.
- SQL Server.
- Eclipse IDE 

## Instalación

1. Configura SQL Server y crea la base de datos `InventoryDB` con las tablas proporcionadas en el script SQL.
2. Configura la conexión en `DBConnection.java` con tus credenciales de SQL Server.
3. Despliega la aplicación en Apache Tomcat.
4. Accede a `http://http://localhost:8080/inventory-system/` para usar la aplicación.

## Uso

1. Inicia sesión con las credenciales proporcionadas.
2. Utiliza los módulos de inventario y movimientos según tu rol.

## Contribuciones

Si deseas contribuir a este proyecto, por favor haz un fork del repositorio y envía un pull request.

## Licencia

Este proyecto está licenciado bajo la Licencia MIT.

