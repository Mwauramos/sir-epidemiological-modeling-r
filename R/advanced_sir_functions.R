# Advanced SIR Model Functions
# Extensions including demographics and infection-induced deaths

if(!require(pacman)) install.packages("pacman")
pacman::p_load(deSolve, tidyverse)

sir_model_vital <- function(time, state, parameters) {
  with(as.list(c(state, parameters)), {
    N <- S + I + R
    dS <- mu * N - beta * S * I - mu * S
    dI <- beta * S * I - gamma * I - mu * I
    dR <- gamma * I - mu * R
    list(c(dS, dI, dR))
  })
}

sir_model_infection_deaths <- function(time, state, parameters) {
  with(as.list(c(state, parameters)), {
    dS <- -beta * S * I
    dI <- beta * S * I - gamma * I - alpha * I
    dR <- gamma * I
    list(c(dS, dI, dR))
  })
}

solve_advanced_sir <- function(model_type, initial_state, parameters, times) {
  model_func <- switch(model_type,
    "vital" = sir_model_vital,
    "infection_deaths" = sir_model_infection_deaths,
    stop("Unknown model type")
  )
  solution <- ode(y = initial_state, times = times, func = model_func, parms = parameters)
  as.data.frame(solution)
}
