# Privatization’s Unequal Toll: Explaining Cross-Country Variation in Mortality and Health Outcomes After Transition From Communism

![Project Status](https://img.shields.io/badge/Status-In%20Progress-yellow)
![Course](https://img.shields.io/badge/Project-Master%20Thesis-blue)
![Python](https://img.shields.io/badge/Python-3.8%2B-blue?logo=python&logoColor=white)
![LaTeX](https://img.shields.io/badge/Docs-LaTeX-008080?logo=latex&logoColor=white)
![Jupyter](https://img.shields.io/badge/Made%20with-Jupyter-orange?logo=jupyter&logoColor=white)
![Pandas](https://img.shields.io/badge/Library-Pandas-150458?logo=pandas&logoColor=white)

## Project Overview

This repository contains the source code, datasets, and LaTeX documents for an **ongoing Master's Thesis**. The research investigates the impact of economic and political transition on public health outcomes, specifically focusing on mortality rates (SDR) in Central and Eastern Europe and the former Soviet Union between 1989 and 2014. The project combines econometric analysis with extensive data aggregation from international institutions.

## Author
* **Wojciech Hrycenko**

---

## Repository Contents

### 1. Data Processing & Analysis
**Files:** `Data/data_extract.ipynb`, `data_from_world_bank_test.py`

**Objective**
To construct a comprehensive panel dataset for econometric analysis by:
1.  **Extracting Macroeconomic Indicators:** GDP per capita, employment rates, and government expenditure (World Bank, Transition Reports).
2.  **Aggregating Health Metrics:** Standardized Death Rates (SDR) for key causes such as:
    * Ischaemic heart disease
    * Diseases of the circulatory system
    * Suicide and self-inflicted injury
    * Alcohol-related causes
    * Malignant neoplasms
3.  **Data Integration:** Merging socio-economic variables (`v_dem.csv`, `transition_indicators`) with health data into a unified dataset (`dane_zintegrowane_1989_2014.csv`).

### 2. Thesis Document (LaTeX)
**Directory:** `LaTeX Master Thesis Hrycenko/`

**Description**
Contains the current source code for the Master's Thesis document.
* **Main File:** `Master Thesis Hrycenko.tex`
* **Structure:** organized into chapters regarding cohorts, mechanisms, and robustness checks (e.g., `cohorts.tex`, `robustness_placebo.tex`).
* **Bibliography:** `myreferences.bib` managing the citations.

### 3. Literature Review & Sources
For a comprehensive overview of the literature and sources used in this research, please refer to the dedicated NotebookLM:
* 📚 **NotebookLM Sources:** [Click here to view literature notes](https://notebooklm.google.com/notebook/4b9f0082-4d42-41aa-9301-445147ea00a4)

---