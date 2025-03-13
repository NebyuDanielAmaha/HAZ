# Determinants of Height-for-Age Z-score (HAZ) among Ethiopian children aged 0–59 months: A multilevel mixed-effects analysis

This repository contains the Stata code used for data cleaning and multilevel regression analysis of Height-for-Age Z-scores (HAZ) from the 2019 Ethiopian Mini Demographic Health Survey (EMDHS), as well as the R code for generating Figure 1, which visualizes key associations between HAZ and demographic factors.

## Repository Contents

* `haz_code.do`: Stata code for data cleaning, descriptive analysis, and multilevel regression analysis.
* `Figure_1_Generation.R`: R code for generating Figure 1, which displays the relationships between HAZ and maternal education, maternal age, child age, and altitude.
* `README.md`: This file.

## Data Access

**Important:** The raw data files `ETKR81FL.DTA` and `ETKR81FL_BMC.dta` are **not included** in this repository. These files are subject to data access policies and must be requested through the DHS Program (Demographic and Health Surveys) Measure website.

To request these data files:

1.  Visit the DHS Program website: [https://dhsprogram.com/](https://dhsprogram.com/)
2.  Navigate to the "Data" section.
3.  Search for the 2019 Ethiopian Mini Demographic Health Survey (EMDHS).
4.  Follow the instructions provided on the DHS Program website to register and submit a data access request. This process typically involves creating an account and completing a data use agreement.
5.  Upon approval of your data access request, you will be able to download the necessary data files.

Please note that the DHS Program has specific guidelines and requirements for data access to ensure responsible data usage and protect respondent confidentiality. Be prepared to provide information about your research project and intended data use as part of the request process.

Once you have obtained the data files, place them in the appropriate directory on your local machine, ensuring the file paths in the Stata and R code are correctly updated.

## Stata Code (`haz_code.do`)

### Data Cleaning and Preparation

The Stata code performs the following tasks:

1.  **Loads the EMDHS dataset (`ETKR81FL.DTA`).**
2.  **Generates sampling weights.**
3.  **Calculates the height-for-age z-score (HAZ).**
4.  **Defines global value labels for categorical variables.**
5.  **Recodes variables:**
    * Early initiation of breastfeeding
    * Vaccination status
    * Vitamin A supplementation
    * Antenatal care visits
    * Place of delivery
    * Water source
    * Sanitation practices
    * Household amenities (radio, electricity, TV)
    * Floor type
    * Capital city residency
    * Maternal religion
    * Maternal literacy
    * Wealth Index
    * Solid fuel for cooking
    * Clean fuel for cooking
6.  **Performs descriptive analysis:**
    * Calculates frequencies and percentages for categorical variables (unweighted).
    * Calculates means and standard deviations for continuous variables (unweighted).
7.  **Checks for missing values and multicollinearity.**
8.  **Conducts multilevel regression analysis:**
    * Null model (Model 0).
    * Model 1 (including proximal factors).
    * Model 2 (including distal factors).
    * Calculates ICC and model fit statistics (AIC, BIC).
    * Compares models.

### How to Run the Stata Code

1.  Ensure you have Stata installed.
2.  Obtain the `ETKR81FL.DTA` file from the DHS Program and place it in the correct directory.
3.  Open `haz_code.do` in Stata.
4.  Run the code.

## R Code (`Figure_1_Generation.R`)

### Figure 1 Generation

The R code generates Figure 1, which visualizes the relationships between HAZ and:

* Maternal education
* Maternal age
* Child age
* Altitude

The code uses `ggplot2` and `gridExtra` packages to create and arrange the plots.

### How to Run the R Code

1.  Ensure you have R and RStudio (or another R IDE) installed.
2.  Install the required R packages: `haven`, `ggplot2`, `gridExtra`, and `tidyverse`.
3.  Obtain the `ETKR81FL_BMC.dta` file from the DHS Program and place it in the correct directory.
4.  Open `Figure_1_Generation.R` in RStudio.
5.  Run the code.

### Required Packages

* `haven`
* `ggplot2`
* `gridExtra`
* `tidyverse`

### Notes

* The data files must be obtained from the DHS Program website.
* Ensure that the file paths in the Stata and R code are correctly set to match the location of your data files.
* This code is provided for informational and reproducibility purposes.

### Contact

For questions or issues, please contact [Nebyu D. Amaha/ nebyudan@gmail.com].
