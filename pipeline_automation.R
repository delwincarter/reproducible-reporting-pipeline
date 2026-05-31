# ==============================================================================
# PIPELINE AUTOMATION MASTER CORE ENGINE
# Architect: Dr. Carter
# Stack: Pure R & Quarto Ecosystem
# ==============================================================================

message("--- STARTING ENTERPRISE AUTOMATION PIPELINE ---")

# Step 1: Execute High-Throughput Distributed Cluster Orchestration
if (file.exists("advanced_scaling/cluster_orchestration.R")) {
  message("\n[STAGE 1] Launching parallel processing computing nodes...")
  source("advanced_scaling/cluster_orchestration.R")
} else {
  stop("Critical Error: Core cluster orchestration script missing.")
}

# Step 2: Trigger Headless Quarto Compilation Engine
if (file.exists("index.qmd")) {
  message("\n[STAGE 2] Ingesting validated analytics into Quarto compilation engine...")
  
  # This programmatic call replaces manual system terminal commands
  quarto::quarto_render("index.qmd", output_format = "html")
  
  message("\n[SUCCESS] Executive Dashboard compiled flawlessly: 'index.html'")
} else {
  stop("Critical Error: Primary Quarto documentation architecture missing.")
}

message("\n--- ENTERPRISE DATA PIPELINE EXECUTION COMPLETE ---")