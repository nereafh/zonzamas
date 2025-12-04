<?php


//define('BOTON_ENVIAR',"<button type=\"submit\" class=\"btn btn-primary\">". Idioma::lit('enviar'.Campo::val('oper'))."</button>");

if (Campo::val('modo') == 'ajax'){
    define('BOTON_ENVIAR',"<button onclick=\"fetchJSON('/horarios/".Campo::val('oper')."/". Campo::val('id') ."?modo=ajax','formulario');
    return false\" class=\"btn btn-primary\">". Idioma::lit('enviar'.Campo::val('oper'))."</button>");
}else{
    define('BOTON_ENVIAR',"<button type=\"submit\" class=\"btn btn-primary\">". Idioma::lit('enviar'.Campo::val('oper'))."</button>");
}

class HorarioController
{

    //static $nick,$password,$oper,$id,$paso,$nombre,$apellidos,$email;


    static function pintar()
    {

        

        $h1cabecera = "<h1>" . Idioma::lit('horario del centro educativo') ."</h1>";
        $contenido = self::desplegable();
      
        return "
        <div class=\"container contenido\">
        <section class=\"page-section horarios\" id=\"horarios\">
            {$h1cabecera}
            {$contenido}
        </section>
        </div>
        
        ";


    }



    static function desplegable()
    {
  
        // Obtenemos los cursos de la base de datos
        $query = new Query("
            SELECT id, curso_numero, nombre_grado, letra
            FROM cursos
            ORDER BY curso_numero, nombre_grado, letra
        ");

        $opciones = "<option selected>Selecciona un horario</option>";
        while ($curso = $query->recuperar()) {
            $nombre_curso = $curso['curso_numero']." ".$curso['nombre_grado']." ".$curso['letra'];
            $opciones .= "<option value='{$curso['id']}'>{$nombre_curso}</option>";
        }

        
        // Si se selecciona un curso por GET (ajax o no), mostramos su horario
        $horario = '';
        if (Campo::val('curso_id')) {
            $horario = self::mostrar_horario(Campo::val('curso_id'));
        }

        return "
            <select class='form-select mb-3' onchange='location.href=\"/horarios/?curso_id=\"+this.value'>
                {$opciones}
            </select>
            {$horario}
        ";
    }

    // Función que genera la tabla del horario completo
    static function mostrar_horario($curso_id)
    {
        $query = new Query("
            SELECT 
                h.dia,
                h.hora_inicio,
                h.hora_fin,
                m.nombre AS nombre_modulo,
                m.siglas AS siglas_modulo,
                m.color AS color_modulo,
                CONCAT(p.nombre, ' ', p.apellidos) AS nombre_profesor,
                c.curso_numero,
                c.nombre_grado,
                c.letra
            FROM horarios h
            JOIN modulos m ON h.id_modulo = m.id
            JOIN personas p ON h.id_profesor = p.id
            JOIN cursos c ON m.curso_asignado = c.id
            WHERE c.id = '{$curso_id}'
            ORDER BY FIELD(h.dia,'L','M','X','J','V'), h.hora_inicio
        ");

        // Organizar por día y hora
        $horas = [];
        $dias = ['L' => 'Lunes','M' => 'Martes','X' => 'Miércoles','J' => 'Jueves','V' => 'Viernes'];
        $horario = [];
        while ($fila = $query->recuperar()) {
            $horario[$fila['hora_inicio']][$fila['dia']][] = $fila;
            $horas[$fila['hora_inicio']] = $fila['hora_inicio'];
        }

        // Construir la tabla
        $tabla = "<table class='table table-bordered'>";
        $tabla .= "<thead><tr><th>Hora</th>";
        foreach ($dias as $dia) {
            $tabla .= "<th>{$dia}</th>";
        }
        $tabla .= "</tr></thead><tbody>";

        foreach ($horas as $hora) {
            $tabla .= "<tr><td>{$hora}</td>";
            foreach ($dias as $clave_dia => $nombre_dia) {
                $celda = '';
                if (!empty($horario[$hora][$clave_dia])) {
                    foreach ($horario[$hora][$clave_dia] as $modulo) {
                        $celda .= "<div style='background-color:{$modulo['color_modulo']}; padding:5px; margin-bottom:2px; color:#fff;'>
                                    <strong>{$modulo['nombre_modulo']}</strong><br>
                                    {$modulo['siglas_modulo']}<br>
                                    {$modulo['nombre_profesor']}<br>
                                    {$modulo['curso_numero']} {$modulo['nombre_grado']} {$modulo['letra']}
                                   </div>";
                    }
                }
                $tabla .= "<td>{$celda}</td>";
            }
            $tabla .= "</tr>";
        }

        $tabla .= "</tbody></table>";
        return $tabla;
    }



}