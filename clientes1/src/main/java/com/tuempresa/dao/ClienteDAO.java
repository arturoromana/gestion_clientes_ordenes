package com.tuempresa.dao;

import java.sql.*;
import java.util.*;
import com.tuempresa.modelo.Cliente;

public class ClienteDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/gestion_clientes_ordenes";
    private String jdbcUsername = "root";
    private String jdbcPassword = "1234";

    private static final String INSERT_CLIENTE_SQL = "{CALL InsertarCliente(?, ?, ?, ?, ?, ?)}";
    private static final String SELECT_CLIENTE_BY_ID = "{CALL ConsultarCliente(?)}";
    private static final String SELECT_ALL_CLIENTES = "SELECT * FROM clientes";
    private static final String DELETE_CLIENTE_SQL = "{CALL EliminarCliente(?)}";
    private static final String UPDATE_CLIENTE_SQL = "{CALL ActualizarCliente(?, ?, ?, ?, ?, ?, ?)}";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    // Insertar cliente
    public void insertarCliente(Cliente cliente) throws SQLException {
        try (Connection connection = getConnection();
             CallableStatement cs = connection.prepareCall(INSERT_CLIENTE_SQL)) {
            cs.setString(1, cliente.getNombre());
            cs.setString(2, cliente.getEmail());
            cs.setString(3, cliente.getTelefono());
            cs.setString(4, cliente.getDireccion());
            cs.setString(5, cliente.getCiudad());
            cs.setString(6, cliente.getPais());
            cs.executeUpdate();
        } catch (SQLException e) {
            //printSQLException(e);
        }
    }

    // Seleccionar cliente por ID
    public Cliente seleccionarCliente(int id) {
        Cliente cliente = null;
        try (Connection connection = getConnection();
             CallableStatement cs = connection.prepareCall(SELECT_CLIENTE_BY_ID)) {
            cs.setInt(1, id);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                String nombre = rs.getString("nombre");
                String email = rs.getString("email");
                String telefono = rs.getString("telefono");
                String direccion = rs.getString("direccion");
                String ciudad = rs.getString("ciudad");
                String pais = rs.getString("pais");
                cliente = new Cliente();
                cliente.setId(id);
                cliente.setNombre(nombre);
                cliente.setEmail(email);
                cliente.setTelefono(telefono);
                cliente.setDireccion(direccion);
                cliente.setCiudad(ciudad);
                cliente.setPais(pais);
            }
        } catch (SQLException e) {
            //printSQLException(e);
        }
        return cliente;
    }

    // Seleccionar todos los clientes
    public List<Cliente> seleccionarTodosClientes() {
        List<Cliente> clientes = new ArrayList<>();
        try (Connection connection = getConnection();
             Statement statement = connection.createStatement();
             ResultSet rs = statement.executeQuery(SELECT_ALL_CLIENTES)) {
            while (rs.next()) {
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                String email = rs.getString("email");
                String telefono = rs.getString("telefono");
                String direccion = rs.getString("direccion");
                String ciudad = rs.getString("ciudad");
                String pais = rs.getString("pais");
                Cliente cliente = new Cliente();
                cliente.setId(id);
                cliente.setNombre(nombre);
                cliente.setEmail(email);
                cliente.setTelefono(telefono);
                cliente.setDireccion(direccion);
                cliente.setCiudad(ciudad);
                cliente.setPais(pais);
                clientes.add(cliente);
            }
        } catch (SQLException e) {
           // printSQLException(e);
        }
        return clientes;
    }

    // Eliminar cliente
    public boolean eliminarCliente(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             CallableStatement cs = connection.prepareCall(DELETE_CLIENTE_SQL)) {
            cs.setInt(1, id);
            rowDeleted = cs.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    // Actualizar cliente
    public boolean actualizarCliente(Cliente cliente) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             CallableStatement cs = connection.prepareCall(UPDATE_CLIENTE_SQL)) {
            cs.setInt(1, cliente.getId());
            cs.setString(2, cliente.getNombre());
            cs.setString(3, cliente.getEmail());
            cs.setString(4, cliente.getTelefono());
            cs.setString(5, cliente.getDireccion());
            cs.setString(6, cliente.getCiudad());
            cs.setString(7, cliente.getPais());
            rowUpdated = cs.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}

