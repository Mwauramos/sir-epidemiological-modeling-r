# Comprehensive Epidemiological Research Analysis
# Advanced SIR modeling with multiple scenarios

source("R/sir_functions.R")
source("R/plotting_functions.R")
source("R/advanced_sir_functions.R")

cat("=== COMPREHENSIVE EPIDEMIOLOGICAL ANALYSIS ===\n")

# Scenario 1: Classic SIR (Boarding School)
boarding_initial <- c(S = 762, I = 1, R = 0)
boarding_params <- c(beta = 0.0026, gamma = 0.5)
boarding_times <- seq(1, 14, by = 1)
classic_results <- solve_sir_model(boarding_initial, boarding_params, boarding_times)

# Scenario 2: Endemic Disease with Demographics  
endemic_initial <- c(S = 99, I = 1, R = 0)
endemic_params <- c(beta = 0.003, gamma = 0.1, mu = 0.02)
endemic_times <- seq(0, 200, by = 1)
endemic_results <- solve_advanced_sir("vital", endemic_initial, endemic_params, endemic_times)

# Scenario 3: High Mortality Pathogen
mortality_initial <- c(S = 99, I = 1, R = 0)
mortality_params <- c(beta = 0.003, gamma = 0.1, alpha = 0.05)
mortality_times <- seq(0, 100, by = 1)
mortality_results <- solve_advanced_sir("infection_deaths", mortality_initial, mortality_params, mortality_times)

# Research Summary
cat("\n=== RESEARCH FINDINGS SUMMARY ===\n")
cat("1. BOARDING SCHOOL (Classic SIR):\n")
cat("   R₀:", round(calculate_R0(0.0026, 0.5, 762), 2), "\n")
cat("   Attack Rate:", round(max(classic_results$R)/763*100, 1), "%\n")

cat("\n2. ENDEMIC DISEASE (With Demographics):\n") 
cat("   Final Equilibrium - S:", round(tail(endemic_results$S,1)), 
    "I:", round(tail(endemic_results$I,1)), 
    "R:", round(tail(endemic_results$R,1)), "\n")

cat("\n3. HIGH MORTALITY PATHOGEN:\n")
initial_pop <- sum(mortality_initial)
final_pop <- tail(mortality_results$S,1) + tail(mortality_results$I,1) + tail(mortality_results$R,1)
mortality_rate <- (initial_pop - final_pop)/initial_pop * 100
cat("   Population Mortality:", round(mortality_rate, 1), "%\n")
cat("   Survivors:", round(final_pop), "of", initial_pop, "\n")

cat("\n✓ Comprehensive analysis complete\n")
