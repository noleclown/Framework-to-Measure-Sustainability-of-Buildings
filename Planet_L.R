library(semPlot)
library(lavaan)

# Generate a random dataset for Planet
set.seed(123)  # for reproducibility
n_obs <- 100    # number of observations
n_indicators <- 4  # number of indicators per latent variable

# Generate random data for indicators
Carbon_footprint <- rnorm(n_obs, mean = 100, sd = 20)
Cumulative_energy_demand <- rnorm(n_obs, mean = 50, sd = 10)
Cumulative_fossil_energy_consumption <- rnorm(n_obs, mean = 30, sd = 5)
Energy_consumption <- rnorm(n_obs, mean = 2, sd = 0.5)
GHG_Emissions <- rnorm(n_obs, mean = 100, sd = 20)
Share_non_renewable_energy <- rnorm(n_obs, mean = 50, sd = 10)
Embodied_emissions_factor <- rnorm(n_obs, mean = 30, sd = 5)
Cumulative_embodied_water_consumption <- rnorm(n_obs, mean = 2, sd = 0.5)
Water_consumption <- rnorm(n_obs, mean = 100, sd = 20)
Tonnes_emissions_water <- rnorm(n_obs, mean = 50, sd = 10)
Land_use <- rnorm(n_obs, mean = 30, sd = 5)
Resource_efficiency <- rnorm(n_obs, mean = 2, sd = 0.5)
Recycling_potential <- rnorm(n_obs, mean = 100, sd = 20)
CD_waste <- rnorm(n_obs, mean = 50, sd = 10)
Circular_Economy <- rnorm(n_obs, mean = 30, sd = 5)
Loss_biodiversity <- rnorm(n_obs, mean = 2, sd = 0.5)
Share_investments_biodiversity <- rnorm(n_obs, mean = 100, sd = 20)
Biodiversity_impact <- rnorm(n_obs, mean = 50, sd = 10)
Acidification <- rnorm(n_obs, mean = 30, sd = 5)
Eutrophication <- rnorm(n_obs, mean = 2, sd = 0.5)
Waste_generation <- rnorm(n_obs, mean = 100, sd = 20)
Tonnes_hazardous_waste <- rnorm(n_obs, mean = 50, sd = 10)
Waste_Management <- rnorm(n_obs, mean = 30, sd = 5)
Supplier_emission_reduction <- rnorm(n_obs, mean = 2, sd = 0.5)
Local_material_sourcing <- rnorm(n_obs, mean = 100, sd = 20)
Energy_Efficiency <- rnorm(n_obs, mean = 50, sd = 10)
Water_Management <- rnorm(n_obs, mean = 30, sd = 5)
BP_Energy_consumption <- rnorm(n_obs, mean = 2, sd = 0.5)
BP_Water_consumption <- rnorm(n_obs, mean = 100, sd = 20)
Locally_sourced_materials <- rnorm(n_obs, mean = 50, sd = 10)
Embodied_carbon_materials <- rnorm(n_obs, mean = 30, sd = 5)
Construction_waste_diversion <- rnorm(n_obs, mean = 2, sd = 0.5)
IEQ <- rnorm(n_obs, mean = 100, sd = 20)
EV_charging_infrastructure <- rnorm(n_obs, mean = 50, sd = 10)
Green_space_ratio <- rnorm(n_obs, mean = 30, sd = 5)
Greywater_recycling <- rnorm(n_obs, mean = 2, sd = 0.5)
Planet <- rnorm(n_obs, mean = 2, sd = 0.5)

# Create a data frame for Planet
data_planet <- data.frame(
  Carbon_footprint, Cumulative_energy_demand, Cumulative_fossil_energy_consumption,
  Energy_consumption, GHG_Emissions, Share_non_renewable_energy, Embodied_emissions_factor,
  Cumulative_embodied_water_consumption, Water_consumption, Tonnes_emissions_water,
  Land_use, Resource_efficiency, Recycling_potential, CD_waste, Circular_Economy,
  Loss_biodiversity, Share_investments_biodiversity, Biodiversity_impact, Acidification,
  Eutrophication, Waste_generation, Tonnes_hazardous_waste, Waste_Management,
  Supplier_emission_reduction, Local_material_sourcing, Energy_Efficiency, Water_Management,
  BP_Energy_consumption, BP_Water_consumption, Locally_sourced_materials,
  Embodied_carbon_materials, Construction_waste_diversion, IEQ, EV_charging_infrastructure,
  Green_space_ratio, Greywater_recycling, Planet
)

# Specify the SEM model for Planet
model_planet <- '
  # Measurement model
  CFE =~ Carbon_footprint + Cumulative_energy_demand + Cumulative_fossil_energy_consumption + Energy_consumption + GHG_Emissions + Share_non_renewable_energy + Embodied_emissions_factor
  WI =~ Cumulative_embodied_water_consumption + Water_consumption + Tonnes_emissions_water
  RUC =~ Land_use + Resource_efficiency + Recycling_potential + CD_waste + Circular_Economy
  BL =~ Loss_biodiversity + Share_investments_biodiversity + Biodiversity_impact
  PW =~ Acidification + Eutrophication + Waste_generation + Tonnes_hazardous_waste + Waste_Management
  SS =~ Supplier_emission_reduction + Local_material_sourcing
  EWE =~ Energy_Efficiency + Water_Management
  BP =~ BP_Energy_consumption + BP_Water_consumption + Locally_sourced_materials + Embodied_carbon_materials + Construction_waste_diversion + IEQ
  GBF =~ EV_charging_infrastructure + Green_space_ratio + Greywater_recycling

  # Structural model (endogenous variable)
  Planet ~ CFE + WI + RUC + BL + PW + SS + EWE + BP + GBF
'

# Fit the SEM model for Planet
fit_planet <- sem(model_planet, data = data_planet)

# Summarize the model for Planet
summary(fit_planet)

# Plot the path diagram for Planet
semPaths(fit_planet, what = "std", layout = "tree2", rotation = 2)
