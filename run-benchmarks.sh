#!/bin/bash

# Crear un directorio para almacenar los outputs
mkdir -p outputs

# Declarar un array para los lenguajes
languages=("python" "java")

# Inicializar arrays para almacenar los tiempos y resultados
declare -A times
declare -A results

# Recorrer cada lenguaje
for lang in "${languages[@]}"; do
    echo "Procesando $lang..."
    cd $lang

    # Construir la imagen de Docker
    echo "Construyendo imagen para $lang..."
    docker build -t sum_primes_$lang .

    # Ejecutar el contenedor y capturar el tiempo de ejecución
    echo "Ejecutando contenedor para $lang..."
    docker run --rm -v "$(pwd)/$lang:app/$lang" sum_primes_$lang
    cd ..
done


