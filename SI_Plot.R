# Load necessary packages
library(lavaan)
library(semPlot)

# 1. Define the Complete Structural Equation Model with All Covariances
model <- '
# Latent Variables with Their Indicators (Planet)
WI =~ CWC + WC + EWC
CFE =~ CF + CED + CFEC + EC + GHG + SNEC + SNEP + EEF
RUC =~ LU + RE + RP + CDW + CERE
BL =~ LOB + SIL + BI
PW =~ A + E + WG + HW + WM
SS =~ SERE + LMS
EWE =~ EE + WM
BP =~ EC + WC + LSM + ECM + CWR + IEQ
GBF =~ EVCI + GSR + GR

# Latent Variables with Their Indicators (People)
LPHR =~ WHSP + TD + DIM + HR_LP + GPG + CIW
CI =~ JC + HA + CE + LE + CBA
GT =~ SI_NC + SI_CW
OW =~ ILC + TC + N + IAQ + DA + OCS
RA =~ R + CRA + RCA
JTP =~ JTP_I   # JTP is both the factor and its indicator
RF =~ RF_I + TSR

# Latent Variables with Their Indicators (Prosperity)
EI =~ JC + HA + LEI + JCEE
FPG =~ ROI_EE + MVP_GB + OCS + IRI_GB + RIP + IPT
CP =~ CP_I + IV + CTS
PF =~ PC + CER

# Structural Model (Planet, People, Prosperity -> Sustainable Index)
PL ~ WI + CFE + RUC + BL + PW + SS + EWE + BP + GBF
PE ~ LPHR + CI + GT + OW + RA + JTP + RF + SS + BP
PR ~ EI + FPG + CP + PF + JTP
SI ~ PL + PE + PR

# All Covariances Between Latent Variables
WI ~~ CFE + RUC + BL + PW + SS + EWE + BP + GBF + LPHR + CI + GT + OW + RA + JTP + EI + FPG + CP + PF
CFE ~~ RUC + BL + PW + SS + EWE + BP + GBF + LPHR + CI + GT + OW + RA + JTP + EI + FPG + CP + PF
RUC ~~ BL + PW + SS + EWE + BP + GBF + LPHR + CI + GT + OW + RA + JTP + EI + FPG + CP + PF
BL ~~ PW + SS + EWE + BP + GBF + LPHR + CI + GT + OW + RA + JTP + EI + FPG + CP + PF
PW ~~ SS + EWE + BP + GBF + LPHR + CI + GT + OW + RA + JTP + EI + FPG + CP + PF
SS ~~ EWE + BP + GBF + LPHR + CI + GT + OW + RA + JTP + EI + FPG + CP + PF
EWE ~~ BP + GBF + LPHR + CI + GT + OW + RA + JTP + EI + FPG + CP + PF
BP ~~ GBF + LPHR + CI + GT + OW + RA + JTP + EI + FPG + CP + PF
LPHR ~~ CI + GT + OW + RA + JTP + EI + FPG + CP + PF
CI ~~ GT + OW + RA + JTP + EI + FPG + CP + PF
GT ~~ OW + RA + JTP + EI + FPG + CP + PF
OW ~~ RA + JTP + EI + FPG + CP + PF
RA ~~ JTP + EI + FPG + CP + PF
JTP ~~ EI + FPG + CP + PF
EI ~~ FPG + CP + PF
FPG ~~ CP + PF
CP ~~ PF
'



# 2. Create a Lavaan Model Object (without fitting to data)
lavaan_model <- lavaan::lavaanify(model)  


# 3. Create Path Diagram
semPaths(lavaan_model, 
         what = "model",   
         layout = "tree3",
         edge.label.cex = 0.5, 
         rotation = 2,
         residuals = FALSE, 
         intercepts = FALSE, 
         sizeMan = 4) 
