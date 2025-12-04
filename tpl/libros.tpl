<h1>Listado de Libros</h1>

<form method="get" class="mb-3">
    <label class="form-label">Filtrar por género:</label>

    <select name="genero" class="form-select w-auto d-inline-block">

        <option value="">Todos</option>

        <option value="Novela"     <?= ($genero_seleccionado == 'Novela') ? 'selected' : '' ?>>Novela</option>
        <option value="Fábula"     <?= ($genero_seleccionado == 'Fábula') ? 'selected' : '' ?>>Fábula</option>
        <option value="Distopía"   <?= ($genero_seleccionado == 'Distopía') ? 'selected' : '' ?>>Distopía</option>
        <option value="Misterio"   <?= ($genero_seleccionado == 'Misterio') ? 'selected' : '' ?>>Misterio</option>
        <option value="Fantasía"   <?= ($genero_seleccionado == 'Fantasía') ? 'selected' : '' ?>>Fantasía</option>
        <option value="Ficción"    <?= ($genero_seleccionado == 'Ficción') ? 'selected' : '' ?>>Ficción</option>

    </select>

    <button class="btn btn-primary">Filtrar</button>
</form>

<table class="table table-striped">
    <thead>
        <tr>
            <th>Título</th>
            <th>Autor</th>
            <th>Género</th>
            <th>ISBN</th>
            <th>Fecha publicación</th>
        </tr>
    </thead>
    <tbody>

        <?php foreach ($libros as $libro): ?>
        <tr>
            <td><?= htmlspecialchars($libro['titulo']) ?></td>
            <td><?= htmlspecialchars($libro['autor']) ?></td>
            <td><?= htmlspecialchars($libro['genero']) ?></td>
            <td><?= htmlspecialchars($libro['isbn']) ?></td>
            <td><?= htmlspecialchars($libro['fecha_publicacion']) ?></td>
        </tr>
        <?php endforeach; ?>

    </tbody>
</table>
