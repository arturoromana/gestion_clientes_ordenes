DELIMITER //

-- Insertar un cliente
CREATE PROCEDURE InsertarCliente (
    IN nombre VARCHAR(100),
    IN email VARCHAR(100),
    IN telefono VARCHAR(20),
    IN direccion VARCHAR(255),
    IN ciudad VARCHAR(100),
    IN pais VARCHAR(100)
)
BEGIN
    INSERT INTO clientes (nombre, email, telefono, direccion, ciudad, pais)
    VALUES (nombre, email, telefono, direccion, ciudad, pais);
END //

-- Actualizar un cliente
CREATE PROCEDURE ActualizarCliente (
    IN id INT,
    IN nombre VARCHAR(100),
    IN email VARCHAR(100),
    IN telefono VARCHAR(20),
    IN direccion VARCHAR(255),
    IN ciudad VARCHAR(100),
    IN pais VARCHAR(100)
)
BEGIN
    UPDATE clientes
    SET nombre = nombre, email = email, telefono = telefono, direccion = direccion, ciudad = ciudad, pais = pais
    WHERE id = id;
END //

-- Eliminar un cliente
CREATE PROCEDURE EliminarCliente (IN id INT)
BEGIN
    DELETE FROM clientes WHERE id = id;
END //

-- Consultar un cliente por ID
CREATE PROCEDURE ConsultarCliente (IN id INT)
BEGIN
    SELECT * FROM clientes WHERE id = id;
END //

DELIMITER ;