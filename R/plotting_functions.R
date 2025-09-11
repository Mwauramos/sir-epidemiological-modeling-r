# Plotting Functions for SIR Model Visualization

if(!require(pacman)) install.packages("pacman")
pacman::p_load(ggplot2, tidyverse, scales)

#' Plot SIR Model Results
plot_sir_results <- function(sir_data, title = "SIR Model Simulation", show_peak = TRUE) {
  p <- ggplot(sir_data, aes(x = time)) +
    geom_line(aes(y = S, color = "Susceptible"), linewidth = 1) +
    geom_line(aes(y = I, color = "Infected"), linewidth = 1) +
    geom_line(aes(y = R, color = "Recovered"), linewidth = 1) +
    scale_color_manual(
      name = "Compartment",
      values = c("Susceptible" = "#2F5597", "Infected" = "#C00000", "Recovered" = "#548235")
    ) +
    labs(title = title, x = "Time (days)", y = "Population Count") +
    theme_minimal() +
    theme(plot.title = element_text(hjust = 0.5, size = 14, face = "bold"), legend.position = "bottom")
  
  if (show_peak && max(sir_data$I) > 0) {
    peak_day <- sir_data$time[which.max(sir_data$I)]
    peak_value <- max(sir_data$I)
    p <- p + 
      annotate("point", x = peak_day, y = peak_value, color = "#C00000", size = 3, shape = 21, fill = "white") +
      annotate("text", x = peak_day, y = peak_value, label = paste("Peak:", round(peak_value)), 
               vjust = -1.5, hjust = 0.5, size = 3.5, color = "#C00000")
  }
  return(p)
}

#' Plot Endemic Dynamics
plot_endemic_dynamics <- function(sir_data, title = "Long-term Epidemic Dynamics") {
  ggplot(sir_data, aes(x = time)) +
    geom_line(aes(y = S, color = "Susceptible"), linewidth = 1) +
    geom_line(aes(y = I, color = "Infected"), linewidth = 1) +
    geom_line(aes(y = R, color = "Recovered"), linewidth = 1) +
    scale_color_manual(
      values = c("Susceptible" = "#2F5597", "Infected" = "#C00000", "Recovered" = "#548235")
    ) +
    labs(title = title, x = "Time (days)", y = "Population Count",
         subtitle = "Extended model with demographic processes") +
    theme_minimal() +
    theme(plot.title = element_text(hjust = 0.5, face = "bold"),
          plot.subtitle = element_text(hjust = 0.5), legend.position = "bottom")
}
