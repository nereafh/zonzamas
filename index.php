<?php

error_reporting(E_ERROR);
ini_set('display_errors', 1);


    require "includes/general.php";

    echo Template::header('Biblioteca');
    echo Template::nav();


    $seccion = Campo::val('seccion') ?? '';
    echo Template::seccion($seccion);


    echo Template::footer(); 
    
    
?>

