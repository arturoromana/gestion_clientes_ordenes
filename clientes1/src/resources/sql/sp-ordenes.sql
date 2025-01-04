DELIMITER //

-- Insertar una orden
CREATE PROCEDURE InsertarOrden (
    IN cliente_id INT,
    IN fecha DATE,
    IN total DECIMAL(10,2)
)
BEGIN
    INSERT INTO ordenes (cliente_id, fecha, total)
    VALUES (cliente_id, fecha, total);
END //

-- Actualizar una orden
CREATE PROCEDURE ActualizarOrden (
    IN id INT,
    IN cliente_id INT,
    IN fecha DATE,
    IN total DECIMAL(10,2)
)
BEGIN
    UPDATE ordenes
    SET cliente_id = cliente_id, fecha = fecha, total = total
    WHERE id = id;
END //

-- Eliminar una orden
CREATE PROCEDURE EliminarOrden (IN id INT)
BEGIN
    DELETE FROM ordenes WHERE id = id;
END //

-- Consultar una orden por ID
CREATE PROCEDURE ConsultarOrden (IN id INT)
BEGIN
    SELECT * FROM ordenes WHERE id = id;
END //

DELIMITER ;
