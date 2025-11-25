<?php

    class Password extends Elemento
    {

        function __construct($datos=[])
        {
            $datos['type'] = 'password';

            parent::__construct($datos);

        }

        function validar()
        {
            $valor = Campo::val($this->nombre);
            if (empty($valor) || strlen($valor) <= 5) {
                $this->error = true;
                $this->literal_error = "<span class='error'>La contraseña debe tener al menos 6 caracteres</span>";
                Formulario::$numero_errores++;
            }
        }
    }