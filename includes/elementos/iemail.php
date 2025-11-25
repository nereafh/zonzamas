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
                $this->literal_error = "<span class='error'>" . Idioma::lit('valor_obligatorio') . "</span>";
                Formulario::$numero_errores++;
            } elseif (!filter_var($valor, FILTER_VALIDATE_EMAIL)) {
                $this->error = true;
                $this->literal_error = "<span class='error'>" . Idioma::lit('email_invalido') . "</span>";
                Formulario::$numero_errores++;
            }
        }
    }