#!/bin/bash
# batch_hpc_submit.sh
# Enterprise Infrastructure-as-Code: Distributed Compute Node Allocation
#SBATCH --job-name=enterprise_data_pipeline
#SBATCH --output=logs/pipeline_execution_%j.log
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=8
#SBATCH --mem=32G
#SBATCH --time=02:00:00

echo "Executing high-throughput data automation pipeline across allocated HPC infrastructure..."

# Initialize the synchronized cloud data environment
module load R/4.3.1

# Execute the primary script via Command Line Interface (CLI)
Rscript advanced_scaling/cluster_orchestration.R

echo "Data aggregation, quality assurance validation, and parallel processing cycles complete."