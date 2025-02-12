#!/bin/bash

# Crear un directorio para almacenar los outputs
mkdir -p outputs

# Declarar un array para los lenguajes
languages=("python" "java")

for lang in "${languages[@]}"; do
    echo "Procesando $lang..."
    cd $lang

    # Construir la imagen de Docker
    echo "Construyendo imagen para $lang..."
    docker build -t "sum_primes_$lang" .

    # Ejecutar el contenedor
    echo "Ejecutando contenedor para $lang..."
    docker run --rm -v "$(pwd):/app" "sum_primes_$lang"
    
    cd ..
done

