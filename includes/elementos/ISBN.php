<?php
class ISBN extends Elemento
{
    function __construct($datos=[])
    {
        $datos['type'] = 'text'; // o 'number' si quieres solo dígitos
        
        parent::__construct($datos);
    }


    
    function validar()
    {
        $valor = Campo::val($this->nombre);

        // Patrón ISBN 10 o 13
        $patron_isbn = "/^(97(8|9))?\d{9}(\d|X)$/";

        if (empty($valor)) {
            $this->error = true;
            $this->literal_error = "<span class='error'>" . Idioma::lit('valor_obligatorio') . "</span>";
            Formulario::$numero_errores++;
        } elseif (!preg_match($patron_isbn, $valor)) {
            $this->error = true;
            $this->literal_error = "<span class='error'>" . Idioma::lit('isbn_invalido') . "</span>";
            Formulario::$numero_errores++;
        }
    }
}
