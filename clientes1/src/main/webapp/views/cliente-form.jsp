<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Formulario de Cliente</title>
</head>
<body>
    <h2>${cliente == null ? 'Nuevo Cliente' : 'Editar Cliente'}</h2>
    <form action="${cliente == null ? 'insert' : 'update'}" method="post">
        <input type="hidden" name="id" value="${cliente.id}">
        <label for="nombre">Nombre:</label>
        <input type="text" name="nombre" value="${cliente.nombre}" required><br>
        <label for="email">Email:</label>
        <input type="email" name="email" value="${cliente.email}" required><br>
        <label for="telefono">Teléfono:</label>
        <input type="text" name="telefono" value="${cliente.telefono}"><br>
        <label for="direccion">Dirección:</label>
        <input type="text" name="direccion" value="${cliente.direccion}"><br>
        <label for="ciudad">Ciudad:</label>
        <input type="text" name="ciudad" value="${cliente.ciudad}"><br>
        <label for="pais">País:</label>
        <input type="text" name="pais" value="${cliente.pais}"><br>
        <input type="submit" value="${cliente == null ? 'Registrar' : 'Actualizar'}">
    </form>
</body>
</html>
