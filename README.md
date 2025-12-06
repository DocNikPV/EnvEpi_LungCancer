---
Genetic markers combined with air pollution exposure in the development of lung cancer in a Northern Israeli cohort of different ethnic origins
---

Author: Nik Danilov, MD

Institution: University of Haifa, School of Public Health

Course: Environmental Epidemiology (Master of Public Health (Biostatistics) program)

Year: 2025

## Project overview

This repository contains the code and analysis for a seminar work investigating the combined influence of genomic alterations and environmental exposures on lung cancer (LC) development in a Northern Israeli cohort.

By integrating molecular biomarker data (EGFR, KRAS, PD-L1, etc.) with spatially resolved air pollution estimates, this study aimed to elucidate gene-environment interactions across cohorts of different ethnic origins.

## Key research questions

- Genomic profiling: What is the prevalence of key driver mutations (e.g., EGFR, KRAS) and PD-L1 expression in the local cohort? 


- Spatial clustering: Do LC cases cluster geographically in the Haifa Bay area, a region known for industrial pollution? 

- Confounder analysis: Is the observed clustering driven by environmental factors or by demographic confounders like smoking and population density? 


## Tech stack & methodology

This project utilized a mixed-tool analytical workflow to ensure rigorous data management, statistical testing, and visualization.

- Data wrangling: Python (pandas), Excel. Cleaning and organizing raw clinical-laboratory data and air pollution metrics.

- Statistical analysis:	Python (scipy, statsmodels). Descriptive statistics, Fisher's exact test, t-tests, and correlation analyses.

- Spatial statistics:	Python (pysal / esda). Kernel density estimation (KDE) for hotspot visualization and Moran’s I / LISA for testing spatial autocorrelation and clustering significance.

- Visualization: Python (matplotlib, seaborn), Power BI. Generating publication-quality plots and interactive geospatial maps.

## Data sources

- Clinical-laboratory data: A dataset of 94 LC cases managed at the Carmel Medical Center (Haifa) in 2024–2025. Variables include demographics, smoking history, histology, and NGS/IHC molecular results.
 
- Environmental data: Annual mean concentrations of key pollutants (PM2.5, PM10, NO2, SO2, O3) obtained from the Israeli Ministry of Environmental Protection (MOEP) monitoring network (2023).

## Key findings

### 1. The smoking confounder

Initial crude mapping suggested significant spatial clustering of LC cases in the Haifa metropolitan area (p = 0.001). However, a rigorous analysis revealed this to be an artifact:

- Population adjustment: When adjusting for population density, the "hotspots" shifted from coastal cities to inland areas (Nazareth, Afula).

- Stratification: When stratified by smoking status, the spatial clustering disappeared entirely (Moran’s I non-significant for both smokers and non-smokers).

Conclusion: Smoking, rather than environmental pollution, was identified as the primary driver of spatial heterogeneity in this specific cohort.

### 2. Molecular epidemiology

- Histology: Adenocarcinoma (ACA) was the dominant LC subtype (67.0%).

- Biomarkers: High rates of actionable mutations were observed, with EGFR, BRAF, and ROS1 found exclusively in ACA cases.
 
- Ethnicity: No significant difference in smoking prevalence was found between Jewish and Arab sub-populations in this cohort.

## Repository structure

- analysis/
        /CarmelMC_LungCancer.pbix    # Power BI report with interactive visualizations
        /Python_mapping.py    # Python script for spatial analysis and mapping
- data/
      /CarmelMC_LungCancer.xlsx    # Cleaned clinical-laboratory dataset
- outputs/
         /a4bf230a-5fab-4e2d-a2a6-a255da8f0c8d.jpeg    # Example output figure from spatial analysis
         /efbc4187-5b20-4685-a474-22cd24e26d0f.jpeg    # Example output figure from spatial analysis
         /Figure_3.2.4.html    # Example output figure from spatial analysis
         /id-locality_map.jpeg    # Example output figure from spatial analysis
         /id-locality_plot.jpeg    # Example output figure from spatial analysis
         /kde_LC_plot.jpeg    # Example output figure from spatial analysis
         /output.png    # Example output figure from spatial analysis
- .gitignore
- ENV_EPI_SEMINAR.code-workspace
- NikolaiDanilov_EnvEpi_SeminarWork.docx
- README.md