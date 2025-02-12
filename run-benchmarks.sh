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
    docker build -t sum_primes_$lang . > /dev/null

    # Ejecutar el contenedor y capturar el tiempo de ejecución
    echo "Ejecutando contenedor para $lang..."
    output=$(docker run --name sum_primes_${lang}_container sum_primes_$lang)
    execution_time=$output

    # Copiar el archivo de salida desde el contenedor
    docker cp sum_primes_${lang}_container:/app/$lang/${lang}_output.txt ../outputs/${lang}_output.txt > /dev/null

    # Eliminar el contenedor
    docker rm sum_primes_${lang}_container > /dev/null

    # Almacenar el tiempo de ejecución y resultado
    times[$lang]=$execution_time
    results[$lang]=$(cat ../outputs/output_${lang}.txt)

    # Volver al directorio anterior
    cd ..
done

# Mostrar la tabla de resultados
echo -e "\nResultados del Benchmark:"
printf "%-10s %-25s %-15s\n" "Lenguaje" "Tiempo de Ejecución (ms)" "Resultado"
for lang in "${languages[@]}"; do
    printf "%-10s %-25s %-15s\n" "$lang" "${times[$lang]}" "${results[$lang]}"
done

