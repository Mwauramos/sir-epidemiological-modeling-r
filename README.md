# Epidemiological Modeling Research Project
**Author: Amos Mwaura**

A comprehensive implementation of SIR/SEIR epidemiological models for analyzing disease outbreak dynamics.

## Overview

This project implements mathematical models for understanding infectious disease transmission patterns, with applications to real-world outbreak data.

## Research Capabilities

- SIR Model Implementation: Complete differential equation solver
- Data Analysis: Historical outbreak case studies including 1978 influenza epidemic  
- Visualization Suite: Professional epidemic curve plotting and phase portraits
- Parameter Estimation: Tools for calculating reproduction numbers and outbreak metrics

## Key Findings

Current model analysis demonstrates:
- Basic reproduction number (R0) calculation capabilities
- Peak infection timing prediction
- Attack rate estimation
- Population dynamics visualization

## Technical Implementation

- Core Functions: R/sir_functions.R, R/plotting_functions.R
- Data Sources: Historical outbreak datasets in data/
- Outputs: Visualizations saved to output/figures/

## Usage

Load functions and analyze outbreak scenario:
source("R/sir_functions.R")
source("R/plotting_functions.R")
results <- solve_sir_model(initial_state, parameters, times)
plot_sir_results(results)

## Applications

This modeling framework can be applied to:
- Public health policy analysis
- Outbreak response planning  
- Academic epidemiological research
- Disease surveillance systems

Research project for epidemiological modeling and analysis
