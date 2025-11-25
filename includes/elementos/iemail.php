<?php

    class IEmail extends Elemento
    {

        function __construct($datos=[])
        {
            $datos['type'] = 'email';

            parent::__construct($datos);

        }

        function validar()
        {
            $valor = Campo::val($this->nombre);
            if (empty($valor)) {
                $this->error = true;
                $this->literal_error = "<span class='error'>Debe introducir un email</span>";
                Formulario::$numero_errores++;
            } elseif (!filter_var($valor, FILTER_VALIDATE_EMAIL)) {
                $this->error = true;
                $this->literal_error = "<span class='error'>Email no válido</span>";
                Formulario::$numero_errores++;
            }
        }
    }