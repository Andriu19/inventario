package com.inventory.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.inventory.model.Movement;
import com.inventory.util.DBConnection;

public class MovementDAO {

    // Método para obtener los movimientos filtrados por tipo
    public List<Movement> getMovements(String type) throws SQLException {
        List<Movement> movements = new ArrayList<>();
        String sql = "SELECT * FROM Movements WHERE MovementType = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, type);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Movement movement = new Movement();
                    movement.setMovementId(rs.getInt("MovementID"));
                    movement.setProductId(rs.getInt("ProductID"));
                    movement.setMovementType(rs.getString("MovementType"));
                    movement.setQuantity(rs.getInt("Quantity"));
                    movement.setMovementDate(rs.getDate("MovementDate"));
                    movement.setPerformedBy(rs.getString("PerformedBy"));
                    movements.add(movement);
                }
            }
        }
        return movements;
    }

    // Método para agregar un nuevo movimiento a la base de datos
    public void addMovement(Movement movement) throws SQLException {
        String sql = "INSERT INTO Movements (ProductID, MovementType, Quantity, MovementDate, PerformedBy) " +
                     "VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, movement.getProductId());
            stmt.setString(2, movement.getMovementType());
            stmt.setInt(3, movement.getQuantity());
            stmt.setTimestamp(4, new Timestamp(System.currentTimeMillis())); // Asigna la fecha actual
            stmt.setString(5, movement.getPerformedBy());

            stmt.executeUpdate();
        }
    }
}
