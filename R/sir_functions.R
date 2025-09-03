# SIR Model Functions
# Core functions for implementing and solving SIR epidemiological models

# Load required packages
if(!require(pacman)) install.packages("pacman")
pacman::p_load(deSolve, tidyverse)

#' SIR Model Differential Equations
sir_model <- function(time, state, parameters) {
  with(as.list(c(state, parameters)), {
    # Calculate rates of change
    dS <- -beta * S * I
    dI <- beta * S * I - gamma * I
    dR <- gamma * I
    
    # Return the rate of change
    list(c(dS, dI, dR))
  })
}

#' Solve SIR Model
solve_sir_model <- function(initial_state, parameters, times) {
  # Solve the differential equations
  sir_solution <- ode(
    y = initial_state,
    times = times,
    func = sir_model,
    parms = parameters
  )
  
  # Convert to data frame
  as.data.frame(sir_solution)
}

#' Calculate Basic Reproduction Number
calculate_R0 <- function(beta, gamma, S_0) {
  R0 <- beta * S_0 / gamma
  return(R0)
}
