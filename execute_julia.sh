#!/bin/bash
#SBATCH --job-name=Benders_Oracle_Test
#SBATCH --output=slurm_%j.out
#SBATCH --error=slurm_%j.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=16G
#SBATCH --time=08:00:00

set -euo pipefail

cd "$SLURM_SUBMIT_DIR"

# Cargar Julia y Gurobi
module load julia/1.12.1
module load gurobi/10.0.3

# Ejecución secuencial
export JULIA_NUM_THREADS=1
export OPENBLAS_NUM_THREADS=1
export OMP_NUM_THREADS=1

# Crear directorios de resultados
mkdir -p results/oracle_comparison/{bigm,indicators,bilinear}/gurobi_logs

echo "Nodo: $(hostname)"
echo "Inicio: $(date)"
echo "Julia: $(julia --version)"

# Ejecutar experimento
julia --project=. --threads=1 main.jl

echo "Fin: $(date)"