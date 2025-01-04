DELIMITER //

-- Insertar un detalle de orden
CREATE PROCEDURE InsertarDetalleOrden (
    IN orden_id INT,
    IN producto_id INT,
    IN cantidad INT,
    IN precio_unitario DECIMAL(10,2)
)
BEGIN
    INSERT INTO detalle_ordenes (orden_id, producto_id, cantidad, precio_unitario)
    VALUES (orden_id, producto_id, cantidad, precio_unitario);
END //

-- Actualizar un detalle de orden
CREATE PROCEDURE ActualizarDetalleOrden (
    IN id INT,
    IN orden_id INT,
    IN producto_id INT,
    IN cantidad INT,
    IN precio_unitario DECIMAL(10,2)
)
BEGIN
    UPDATE detalle_ordenes
    SET orden_id = orden_id, producto_id = producto_id, cantidad = cantidad, precio_unitario = precio_unitario
    WHERE id = id;
END //

-- Eliminar un detalle de orden
CREATE PROCEDURE EliminarDetalleOrden (IN id INT)
BEGIN
    DELETE FROM detalle_ordenes WHERE id = id;
END //

-- Consultar un detalle de orden por ID
CREATE PROCEDURE ConsultarDetalleOrden (IN id INT)
BEGIN
    SELECT * FROM detalle_ordenes WHERE id = id;
END //

DELIMITER ;
