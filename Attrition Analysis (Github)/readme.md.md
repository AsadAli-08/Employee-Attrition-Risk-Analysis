1\. Project Title

Employee Attrition Risk Analytics



2\. Project Overview

This project develops a predictive analytics system to identify employees at high risk of resignation and understand the key factors driving employee attrition.

The project integrates Oracle SQL, Python machine learning, and Power BI dashboards to deliver actionable workforce insights.



3\. Problem Statement

Organizations often struggle to identify employees who are likely to resign. Traditional HR reporting focuses only on historical attrition.

This project builds a predictive attrition risk model that enables proactive employee retention strategies.



4\. Tools \& Technologies

a) Oracle SQL	:	Data extraction and feature engineering

b) Python		:	Data preprocessing and machine learning

c) Scikit-learn	:	Logistic regression modeling

d) Pandas / NumPy	:	Data manipulation

e) Power BI		:	Visualization and dashboard



5\. Data Description

The dataset used in this project includes employee-level HR information such as:

a) Employee master data : PROJECT\_EMP\_MASTER

b) Career progression : PROJECT\_PROMOTION\_MASTER

c) Training records : PROJECT\_TRAINING\_MASTER

d) Performance ratings : PROJECT\_PERF\_MASTER

e) Absence history : PROJECT\_ABSENCE\_MASTER

f) Payroll data : PROJECT\_SALARY\_MASTER

g) Incentive data : PROJECT\_INCENTIVE\_MASTER

h) Job Rotation data: PROJECT\_POSITION\_MASTER

Note: Due to confidentiality restrictions, the original dataset is not included in this repository.



6\. Feature Engineering

Several predictive features were created to capture behavioral and compensation patterns.

Key engineered features include:

a) training\_days\_36m	:	Training Days in last 3 years

b) pos\_chng\_count	:	Position Changes in last 3 years

c) perf\_slope	: (Current Performance Score – Previous Performance Score)/2

d) curr\_score	:	Latest Score

e) Perf\_delta	:	Current – Previous Score

f) months\_since\_prom	:	Months since last promotion

g) prom\_count		:	Total Promotions since Joining

h) stagflation	:	1 is no promotion in last 3 years

i) incentive\_volatility	:	Standard deviation of last 4 incentives

j) incentive\_sum\_last3y	:	Total Incentive in last 3 years

k) absence\_days\_6m	:	Total Absence Days in last 6 months

l) absence\_rate\_3m	:	Absence Days in last 3 months/ 90

m) absence\_rate\_30d	:	Absence Days in last 30 days / 30

n) absence\_spike	:	absence\_rate\_30d/ absence\_rate\_3m

o) sal\_growth	:	Change/ Salary 12m ago

p) compa\_ratio	:	Employee salary/median salary of unit/grade

q) below\_peer\_flag	:	Y if comparatio <0.95

r) Unit	:	Organisational Unit 

s) Location	:	Location of Unit

t) Tenure\_mm	:	Tenure in months

u) Age\_yy	:	Age in years

v) Function	: Function (Job Specialisation)

w) Resig\_flag : 	Y if Resigned in coming 6 months

x) resig\_same\_unit\_grade	: Resigned same unit/grade in past 12 months





7\. Machine Learning Model

The attrition prediction model uses **Logistic Regression**.

a) Target Variable	:	RESIG\_FLAG

b) Model Output	:	Probability of employee resignation

c) Model performance metric	:	ROC AUC Score



8\. Dashboard

The Power BI dashboard provides several analytical views:

a)	Executive Overview	:	Summary metrics for attrition trends and workforce risk.

b)	Attrition History	:	Historical attrition patterns across departments and locations.

c) 	Attrition Risk Prediction	:	Identification of employees with high predicted attrition probability.

d)	Employee Risk Register		:	Detailed list of employees with high resignation probability.

e)	Attrition Driver Diagnostics	:	Analysis of factors influencing attrition risk.



9\. Key Insights

a) Employees with high Incentive Volatility are at higher risk of resigning.

b) Employees with more absence days in past 6 months are at higher risk of resigning.

c) Risk of Resignation declines with age of employee.

d) Employees with higher Salary growth have lower risk of Resignation.

e) Resignation risk declines with increase in Compa Ratio.





10\. Project Architecture

Oracle Database

&#x20;      ↓

Feature Engineering (SQL Views)

&#x20;      ↓

Python Data Processing

&#x20;      ↓

Machine Learning Model 

&#x20;      ↓

Power BI Dashboard



11\. Repository Structure

employee-attrition-risk-analysis

├── sql

│   ├── feature\_engineering

│   └── snapshot\_creation

│

├── python

│   └── attrition\_analysis\_project.ipynb

│   

&#x20;|── powerbi screenshots

│   ├── executive summary (Screenshot)

│   └── historical attrition analysis

│   └── attrition risk prediction

│   └── employee risk register

│   └── attrition driver \& diagnostics

│

└── readme.md



12\. Disclaimer

This project was developed using internal organizational HR data. 

Due to confidentiality restrictions, the original dataset and Power BI file containing real employee data are not included. 

Sample structures and screenshots are provided for demonstration purposes.

