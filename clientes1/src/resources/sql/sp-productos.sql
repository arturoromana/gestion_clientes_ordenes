DELIMITER //

-- Insertar un producto
CREATE PROCEDURE InsertarProducto (
    IN nombre VARCHAR(100),
    IN descripcion TEXT,
    IN precio DECIMAL(10,2)
)
BEGIN
    INSERT INTO productos (nombre, descripcion, precio)
    VALUES (nombre, descripcion, precio);
END //

-- Actualizar un producto
CREATE PROCEDURE ActualizarProducto (
    IN id INT,
    IN nombre VARCHAR(100),
    IN descripcion TEXT,
    IN precio DECIMAL(10,2)
)
BEGIN
    UPDATE productos
    SET nombre = nombre, descripcion = descripcion, precio = precio
    WHERE id = id;
END //

-- Eliminar un producto
CREATE PROCEDURE EliminarProducto (IN id INT)
BEGIN
    DELETE FROM productos WHERE id = id;
END //

-- Consultar un producto por ID
CREATE PROCEDURE ConsultarProducto (IN id INT)
BEGIN
    SELECT * FROM productos WHERE id = id;
END //

DELIMITER ;
