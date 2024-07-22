# Load necessary packages
library(lavaan)
library(semPlot)

# Generate a random dataset
set.seed(123)  # for reproducibility
n_obs <- 200    # number of observations

# Generate random data for indicators of Planet
CWC <- rnorm(n_obs, mean = 50, sd = 10)
WC <- rnorm(n_obs, mean = 60, sd = 15)
EWC <- rnorm(n_obs, mean = 70, sd = 12)
CF <- rnorm(n_obs, mean = 100, sd = 20)
CED <- rnorm(n_obs, mean = 50, sd = 10)
CFEC <- rnorm(n_obs, mean = 30, sd = 5)
EC <- rnorm(n_obs, mean = 2, sd = 0.5)
GHG <- rnorm(n_obs, mean = 100, sd = 20)
SNEC <- rnorm(n_obs, mean = 50, sd = 10)
SNEP <- rnorm(n_obs, mean = 30, sd = 5)
EEF <- rnorm(n_obs, mean = 2, sd = 0.5)
LU <- rnorm(n_obs, mean = 100, sd = 20)
RE <- rnorm(n_obs, mean = 50, sd = 10)
RP <- rnorm(n_obs, mean = 30, sd = 5)
CDW <- rnorm(n_obs, mean = 2, sd = 0.5)
CERE <- rnorm(n_obs, mean = 100, sd = 20)
LOB <- rnorm(n_obs, mean = 50, sd = 10)
SIL <- rnorm(n_obs, mean = 30, sd = 5)
BI <- rnorm(n_obs, mean = 2, sd = 0.5)
A <- rnorm(n_obs, mean = 100, sd = 20)
E <- rnorm(n_obs, mean = 50, sd = 10)
WG <- rnorm(n_obs, mean = 30, sd = 5)
HW <- rnorm(n_obs, mean = 2, sd = 0.5)
WM <- rnorm(n_obs, mean = 100, sd = 20)
SERE <- rnorm(n_obs, mean = 50, sd = 10)
LMS <- rnorm(n_obs, mean = 30, sd = 5)
EE <- rnorm(n_obs, mean = 2, sd = 0.5)
EVCI <- rnorm(n_obs, mean = 100, sd = 20)
GSR <- rnorm(n_obs, mean = 50, sd = 10)
GR <- rnorm(n_obs, mean = 30, sd = 5)

# Generate random data for indicators of People
WHSP <- rnorm(n_obs, mean = 50, sd = 10)
TD <- rnorm(n_obs, mean = 60, sd = 15)
DIM <- rnorm(n_obs, mean = 70, sd = 12)
HR_LP <- rnorm(n_obs, mean = 100, sd = 20)
GPG <- rnorm(n_obs, mean = 50, sd = 10)
CIW <- rnorm(n_obs, mean = 30, sd = 5)
JC <- rnorm(n_obs, mean = 2, sd = 0.5)
HA <- rnorm(n_obs, mean = 100, sd = 20)
CE <- rnorm(n_obs, mean = 50, sd = 10)
LE <- rnorm(n_obs, mean = 30, sd = 5)
CBA <- rnorm(n_obs, mean = 2, sd = 0.5)
SI_NC <- rnorm(n_obs, mean = 100, sd = 20)
SI_CW <- rnorm(n_obs, mean = 50, sd = 10)
ILC <- rnorm(n_obs, mean = 30, sd = 5)
TC <- rnorm(n_obs, mean = 2, sd = 0.5)
N <- rnorm(n_obs, mean = 100, sd = 20)
IAQ <- rnorm(n_obs, mean = 50, sd = 10)
DA <- rnorm(n_obs, mean = 30, sd = 5)
OCS <- rnorm(n_obs, mean = 2, sd = 0.5)
R <- rnorm(n_obs, mean = 100, sd = 20)
CRA <- rnorm(n_obs, mean = 50, sd = 10)
RCA <- rnorm(n_obs, mean = 30, sd = 5)
JTP_I <- rnorm(n_obs, mean = 2, sd = 0.5)
RF_I <- rnorm(n_obs, mean = 100, sd = 20)
TSR <- rnorm(n_obs, mean = 50, sd = 10)

# Generate random data for indicators of Prosperity
LEI <- rnorm(n_obs, mean = 30, sd = 5)
JCEE <- rnorm(n_obs, mean = 2, sd = 0.5)
ROI_EE <- rnorm(n_obs, mean = 100, sd = 20)
MVP_GB <- rnorm(n_obs, mean = 50, sd = 10)
IRI_GB <- rnorm(n_obs, mean = 30, sd = 5)
RIP <- rnorm(n_obs, mean = 2, sd = 0.5)
IPT <- rnorm(n_obs, mean = 100, sd = 20)
CP_I <- rnorm(n_obs, mean = 50, sd = 10)
IV <- rnorm(n_obs, mean = 30, sd = 5)
CTS <- rnorm(n_obs, mean = 2, sd = 0.5)
PC <- rnorm(n_obs, mean = 100, sd = 20)
CER <- rnorm(n_obs, mean = 50, sd = 10)

# Generate random data for additional indicators
LSM <- rnorm(n_obs, mean = 100, sd = 20)
ECM <- rnorm(n_obs, mean = 50, sd = 10)
CWR <- rnorm(n_obs, mean = 30, sd = 5)
IEQ <- rnorm(n_obs, mean = 2, sd = 0.5)

# Generate random data for SI index
PL <- rnorm(n_obs, mean = 0, sd = 1)
PE <- rnorm(n_obs, mean = 0, sd = 1)
PR <- rnorm(n_obs, mean = 0, sd = 1)
SI <- rnorm(n_obs, mean = 0, sd = 1)

# Combine all data into one dataframe
data_all <- data.frame(
  CWC, WC, EWC, CF, CED, CFEC, EC, GHG, SNEC, SNEP, EEF, LU, RE, RP, CDW, CERE, LOB, SIL, BI, A, E, WG, HW, WM, SERE, LMS, EE, EVCI, GSR, GR,
  WHSP, TD, DIM, HR_LP, GPG, CIW, JC, HA, CE, LE, CBA, SI_NC, SI_CW, ILC, TC, N,IAQ, DA, OCS, R, CRA, RCA, JTP_I, RF_I, TSR,
  LEI, JCEE, ROI_EE, MVP_GB, IRI_GB, RIP, IPT, CP_I, IV, CTS, PC, CER,
  PL, PE, PR, SI,
  LSM, ECM, CWR, IEQ
)

head(data_all)
data_all

model_si <- '
WI =~ CWC + WC + EWC
CFE =~ CF + CED + CFEC + EC + GHG + SNEC + SNEP + EEF
RUC =~ LU + RE + RP + CDW + CERE
BL =~ LOB + SIL + BI
PW =~ A + E + WG + HW + WM
SS =~ SERE + LMS
EWE =~ EE + WM
BP =~ EC + WC + LSM + ECM + CWR + IEQ
GBF =~ EVCI + GSR + GR

LPHR =~ WHSP + TD + DIM + HR_LP + GPG + CIW
CI =~ JC + HA + CE + LE + CBA
GT =~ SI_NC + SI_CW
OW =~ ILC + TC + N + IAQ + DA + OCS
RA =~ R + CRA + RCA
JTP =~ JTP_I # JTP is both the factor and its indicator
RF =~ RF_I + TSR

EI =~ JC + HA + LEI + JCEE
FPG =~ ROI_EE + MVP_GB + OCS + IRI_GB + RIP + IPT
CP =~ CP_I + IV + CTS
PF =~ PC + CER

PL ~ WI + CFE + RUC + BL + PW + SS + EWE + BP + GBF
PE ~ LPHR + CI + GT + OW + RA + JTP + RF + SS + BP
PR ~ EI + FPG + CP + PF + JTP
SI ~ PL + PE + PR

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

fit_si <- sem(model_si, data = data_all)

summary(fit_si)

semPaths(fit_si,
         what = "std",
         layout = "tree3",
         edge.label.cex = 0.5,
         rotation = 2,
         residuals = FALSE,
         intercepts = FALSE,
         sizeMan = 4)
  