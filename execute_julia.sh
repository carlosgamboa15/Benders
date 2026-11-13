#!/bin/bash
#SBATCH --job-name=julia_benders
#SBATCH --nodes=1
#SBATCH --ntasks=10
#SBATCH --time=04:00:00
#SBATCH --mem=32G
#SBATCH --output=julia_%j.out
#SBATCH --error=julia_%j.err

# Ir al directorio del proyecto
cd "$SLURM_SUBMIT_DIR" || exit 1

# Mostrar información de ejecución
echo "Directorio de trabajo: $PWD"
echo "Tareas SLURM: $SLURM_NTASKS"
echo "Inicio: $(date)"

# Cargar Julia: sustituir por la versión disponible
module load julia/1.12.1
module load gurobi/10.0.3

# Ejecutar el programa
julia --project=. main.jl