library(semPlot)
library(lavaan)

# Generate a random dataset for People
set.seed(123)  # for reproducibility
n_obs <- 100    # number of observations

# Generate random data for indicators
Share_fossil_fuel_sector <- rnorm(n_obs, mean = 50, sd = 10)
Share_biodiversity_sensitive_areas <- rnorm(n_obs, mean = 30, sd = 5)
Share_violations <- rnorm(n_obs, mean = 20, sd = 3)
Investment_clean_energy <- rnorm(n_obs, mean = 70, sd = 15)
Worker_health_safety <- rnorm(n_obs, mean = 80, sd = 12)
Training_development <- rnorm(n_obs, mean = 90, sd = 8)
Diversity_inclusion <- rnorm(n_obs, mean = 85, sd = 10)
Human_rights_labor_policies <- rnorm(n_obs, mean = 75, sd = 15)
Gender_pay_gap <- rnorm(n_obs, mean = 20, sd = 5)
Controversial_weapons <- rnorm(n_obs, mean = 10, sd = 3)
Job_creation <- rnorm(n_obs, mean = 90, sd = 15)
House_affordability <- rnorm(n_obs, mean = 85, sd = 10)
Community_engagement <- rnorm(n_obs, mean = 70, sd = 15)
Local_employment <- rnorm(n_obs, mean = 80, sd = 12)
CBA <- rnorm(n_obs, mean = 75, sd = 8)
Governance_transparency <- rnorm(n_obs, mean = 65, sd = 15)
Controversial_weapons_gov <- rnorm(n_obs, mean = 10, sd = 3)
Indoor_conditions <- rnorm(n_obs, mean = 85, sd = 10)
Thermal_comfort <- rnorm(n_obs, mean = 80, sd = 12)
Noise <- rnorm(n_obs, mean = 75, sd = 8)
IAQ <- rnorm(n_obs, mean = 70, sd = 15)
Daylight_access <- rnorm(n_obs, mean = 75, sd = 10)
Occupant_comfort <- rnorm(n_obs, mean = 80, sd = 15)
Resilience_adaptation <- rnorm(n_obs, mean = 70, sd = 12)
Climate_risk_adaptation <- rnorm(n_obs, mean = 65, sd = 10)
Resiliency_cost_avoidance <- rnorm(n_obs, mean = 60, sd = 8)
Just_transition_planning <- rnorm(n_obs, mean = 75, sd = 15)
Resident_feedback <- rnorm(n_obs, mean = 80, sd = 12)
Tenant_satisfaction <- rnorm(n_obs, mean = 85, sd = 10)

# Create a data frame for People
data_people <- data.frame(
  Share_fossil_fuel_sector, Share_biodiversity_sensitive_areas, Share_violations,
  Investment_clean_energy, Worker_health_safety, Training_development,
  Diversity_inclusion, Human_rights_labor_policies, Gender_pay_gap,
  Controversial_weapons, Job_creation, House_affordability,
  Community_engagement, Local_employment, CBA, Governance_transparency,
  Controversial_weapons_gov, Indoor_conditions, Thermal_comfort, Noise,
  IAQ, Daylight_access, Occupant_comfort, Resilience_adaptation,
  Climate_risk_adaptation, Resiliency_cost_avoidance, Just_transition_planning,
  Resident_feedback, Tenant_satisfaction, People = rnorm(n_obs, mean = 2, sd = 0.5)
)

# Specify the SEM model for People
model_people <- '
  # Investment Impact (Negative)
  IIN =~ Share_fossil_fuel_sector + Share_biodiversity_sensitive_areas + Share_violations

  # Investment Impact (Positive)
  IIP =~ Investment_clean_energy

  # Labor Practices & Human Rights
  LPHR =~ Worker_health_safety + Training_development + Diversity_inclusion + Human_rights_labor_policies +
          Gender_pay_gap + Controversial_weapons

  # Community Impact
  CI =~ Job_creation + House_affordability + Community_engagement + Local_employment + CBA

  # Governance & Transparency
  GT =~ Governance_transparency + Controversial_weapons_gov

  # Occupant Well-being
  OWB =~ Indoor_conditions + Thermal_comfort + Noise + IAQ + Daylight_access + Occupant_comfort

  # Resilience & Adaptation
  RA =~ Resilience_adaptation + Climate_risk_adaptation + Resiliency_cost_avoidance

  # Just Transition Planning
  JTP =~ Just_transition_planning

  # Resident Feedback
  RF =~ Resident_feedback + Tenant_satisfaction

  # Structural model (endogenous variable)
  People ~ IIN + IIP + LPHR + CI + GT + OWB + RA + JTP + RF
'

# Fit the SEM model for People
fit_people <- sem(model_people, data = data_people)

# Summarize the model for People
summary(fit_people)

# Plot the path diagram for People
semPaths(fit_people, what = "std", layout = "tree2", rotation = 2)
