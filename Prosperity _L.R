library(semPlot)
library(lavaan)

# Generate a random dataset
set.seed(123)  # for reproducibility
n_obs <- 100    # number of observations
n_indicators <- 4  # number of indicators per latent variable

# Generate random data for indicators
Job_Creation <- rnorm(n_obs, mean = 100, sd = 20)
House_Affordability <- rnorm(n_obs, mean = 50, sd = 10)
Local_Economic_Impact <- rnorm(n_obs, mean = 30, sd = 5)
Job_Creation_Energy_Efficiency <- rnorm(n_obs, mean = 2, sd = 0.5)
ROI_Energy_Efficiency <- rnorm(n_obs, mean = 100, sd = 20)
Market_Value_Premium <- rnorm(n_obs, mean = 50, sd = 10)
Operational_Cost_Savings <- rnorm(n_obs, mean = 30, sd = 5)
Increased_Rental_Income <- rnorm(n_obs, mean = 2, sd = 0.5)
Reduced_Insurance_Premiums <- rnorm(n_obs, mean = 100, sd = 20)
Increased_Property_Tax_Revenue <- rnorm(n_obs, mean = 50, sd = 10)
Carbon_Price <- rnorm(n_obs, mean = 30, sd = 5)
Import_Volume <- rnorm(n_obs, mean = 2, sd = 0.5)
Carbon_Tax_Saving <- rnorm(n_obs, mean = 100, sd = 20)
Product_Category <- rnorm(n_obs, mean = 50, sd = 10)
Currency_Exchange_Rate <- rnorm(n_obs, mean = 30, sd = 5)
Prosperity <- rnorm(n_obs, mean = 2, sd = 0.5)

# Create a data frame
data <- data.frame(Job_Creation, House_Affordability, Local_Economic_Impact,
                   Job_Creation_Energy_Efficiency, ROI_Energy_Efficiency,
                   Market_Value_Premium, Operational_Cost_Savings,
                   Increased_Rental_Income, Reduced_Insurance_Premiums,
                   Increased_Property_Tax_Revenue, Carbon_Price, Import_Volume,
                   Carbon_Tax_Saving, Product_Category, Currency_Exchange_Rate,
                   Prosperity)
head(data)
data

# Specify the SEM model
model <- '
  # Measurement model
  EI =~ Job_Creation + House_Affordability + Local_Economic_Impact + Job_Creation_Energy_Efficiency
  FP =~ ROI_Energy_Efficiency + Market_Value_Premium + Operational_Cost_Savings + Increased_Rental_Income + Reduced_Insurance_Premiums + Increased_Property_Tax_Revenue
  CP =~ Carbon_Price + Import_Volume + Carbon_Tax_Saving
  PF =~ Product_Category + Currency_Exchange_Rate

  # Structural model
  Prosperity ~ EI + FP + CP + PF
'

# Fit the SEM model
fit <- sem(model, data)

# Summarize the model
summary(fit)

# Plot the path diagram
semPaths(fit, what = "std", layout = "tree2", rotation = 2)