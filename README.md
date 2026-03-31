# Employee Attrition Risk Analysis

## **Project Overview**

This project develops a predictive analytics system to identify employees at high risk of resignation and understand the key factors driving employee attrition.

The project integrates Oracle SQL, Python machine learning, and Power BI dashboards to deliver actionable workforce insights.

## **Problem Objectives**

*  Develop a workforce planning engine to forecast headcount requirements over a 6–12 month horizon
*  Estimate future workforce supply by incorporating attrition risk and expected employee exits
*  Model business-driven workforce demand using growth projections and historical hiring trends
*  Identify workforce gaps (shortage/surplus) across roles, grades, and locations
*  Generate data-driven hiring plans aligned with projected gaps and hiring capacity
*  Enable scenario-based planning (e.g., high attrition, growth surge, hiring freeze) for strategic decision-making
*  Provide actionable insights to HR and leadership for proactive talent management
*  Build an interactive dashboard (Power BI) to visualize forecasts, gaps, and hiring strategies
*  Integrate predictive outputs (attrition model) into a prescriptive decision-making framework
*  Support cost and workforce optimization by aligning hiring strategy with business needs

## **Tools & Technologies**

*  Oracle SQL : Data extraction and feature engineering

*  Python : Data preprocessing and machine learning

*  Scikit-learn : Logistic regression modeling

*  Pandas / NumPy : Data manipulation

*  Power BI : Visualization and dashboard

## **Data Description**

The dataset used in this project includes employee-level HR information such as:

*  Employee master data : PROJECT_EMP_MASTER

*  Career progression : PROJECT_PROMOTION_MASTER

*  Training records : PROJECT_TRAINING_MASTER

*  Performance ratings : PROJECT_PERF_MASTER

*  Absence history : PROJECT_ABSENCE_MASTER

*  Payroll data : PROJECT_SALARY_MASTER

*  Incentive data : PROJECT_INCENTIVE_MASTER

*  Job Rotation data: PROJECT_POSITION_MASTER

Note: Due to confidentiality restrictions, the original dataset is not included in this repository.

## **Feature Engineering**

Several predictive features were created to capture behavioral and compensation patterns.

Key engineered features include:

*  training_days_36m : Training Days in last 3 years

*  pos_chng_count : Position Changes in last 3 years

*  perf_slope : (Current Performance Score – Previous Performance Score)/2

*  curr_score : Latest Score

*  Perf_delta : Current – Previous Score

*  months_since_prom : Months since last promotion

*  prom_count : Total Promotions since Joining

*  stagflation : 1 is no promotion in last 3 years

*  incentive_volatility : Standard deviation of last 4 incentives

*  incentive_sum_last3y : Total Incentive in last 3 years

*  absence_days_6m : Total Absence Days in last 6 months

*  absence_rate_3m : Absence Days in last 3 months/ 90

*  absence_rate_30d : Absence Days in last 30 days / 30

*  absence_spike : absence_rate_30d/ absence_rate_3m

*  sal_growth : Change/ Salary 12m ago

*  compa_ratio : Employee salary/median salary of unit/grade

*  below_peer_flag : Y if comparatio <0.95

*  Unit : Organisational Unit

*  Location : Location of Unit

*  Tenure_mm : Tenure in months

*  Age_yy : Age in years

*  Function : Function (Job Specialisation)

*  Resig_flag : Y if Resigned in coming 6 months

*  resig_same_unit_grade : Resigned same unit/grade in past 12 months

## **Machine Learning Model**

The attrition prediction model uses Logistic Regression.

*  Target Variable : RESIG_FLAG

*  Model Output : Probability of employee resignation

*  Model performance metric : ROC AUC Score

## **Power BI Dashboard**

The Power BI dashboard provides several analytical views:

*  Executive Overview : Summary metrics for attrition trends and workforce risk.

*  Attrition History : Historical attrition patterns across departments and locations.

*  Attrition Risk Prediction : Identification of employees with high predicted attrition probability.

*  Employee Risk Register : Detailed list of employees with high resignation probability.

*  Attrition Driver Diagnostics : Analysis of factors influencing attrition risk.

## **Key Insights**

Analysis of employee attrition drivers indicates that resignation risk is primarily influenced by three factors:

*  Current Performance Score – Employees with low performance scores show significantly higher attrition probability, making this the strongest driver.

*  Incentive Volatility – High variability in incentive payouts is strongly associated with increased resignation risk.

*  Early Career Employees (Age / Tenure) – Younger employees and those with shorter tenure exhibit elevated attrition risk.

These findings suggest that performance engagement, incentive stability, and early career retention initiatives should be prioritized to reduce attrition risk.

## **Project Architecture**

Oracle Database

↓

Feature Engineering (SQL Views)

↓

Python Data Processing

↓

Machine Learning Model

↓

Power BI Dashboard


## **Disclaimer**

This project was developed using internal organizational HR data.

Due to confidentiality restrictions, the original dataset and Power BI file containing real employee data are not included.

Sample structures and screenshots are provided for demonstration purposes.

## Author

Asad Ali
