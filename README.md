# CRM Analytics – Opportunity Performance Dashboard

## 🎯 Project Objectives

* Analyze **CRM opportunity performance** and monitor the overall sales opportunity pipeline.
* Track key KPIs such as **Expected Amount, Active Opportunities, Conversion Rate, Win Rate, and Loss Rate**.
* Analyze **Expected vs. Forecast revenue trends** over time.
* Compare **Active Opportunities with Total Opportunities** to understand opportunity trends.
* Analyze **Closed Won Opportunities** against total and closed opportunities.
* Evaluate **Expected Amount by Opportunity Type**.
* Analyze opportunities across different **Industries** to identify business trends and patterns.
* Provide interactive and meaningful visualizations to support **data-driven business decisions**.

##  Data Model / Schema

The CRM Analytics project follows a Galaxy Schema (Fact Constellation Schema) with multiple fact tables sharing common dimension tables.

* Fact Tables: fact_opportunity, fact_lead, fact_opp_product
* Dimension Tables: dim_account, dim_user

This schema supports scalable CRM analysis, KPI calculation, and reporting.

##  Business Requirements

* Monitor overall **opportunity performance** and pipeline activity.
* Track key KPIs such as **Expected Amount, Active Opportunities, Conversion Rate, Win Rate, and Loss Rate**.
* Analyze Opportunity trend over time.
* Evaluate opportunity performance by **Opportunity Type and Industry**.
* Compare **Won, Lost, Active, and Total Opportunities**.
* Provide interactive dashboards to support **data-driven sales decisions**.

## Process

* **Data Preparation & Modeling:** Cleaned, organized, and structured the opportunity data for analysis.
* **Data Analysis:** Calculate KPI's and Analyzed opportunities by stage, industry, lead source, and time.
* **KPI & Visualization:** Created KPIs and visualizations to identify trends and performance.
* **Dashboard Development:** Built an interactive Tableau dashboard with filters.
* **Insights:** Identified key revenue opportunities and areas of opportunity loss.

## Data Modelling

<img width="731" height="432" alt="Screenshot 2026-09-08 151456" src="https://github.com/user-attachments/assets/b1a64391-8b0f-4a88-88a0-d2998249563b" />

##  Observations

* 4,646 total opportunities, with 1,272 active opportunities generating $184.14M expected revenue.
* Conversion rate stands at 31.06%, with 57.23% opportunities lost.
* Military industry leads expected revenue at $47.05M.
* Opportunity volume peaks in June with 671 opportunities.
* Closed Lost contributes the highest revenue among opportunity stages.

## Tableau - CRM Opportunity Performance Dashboard

<img width="1602" height="906" alt="Screenshot 2026-09-08 163504" src="https://github.com/user-attachments/assets/6f014d71-7951-4aaa-9de5-78a62810bf54" />

## Conclusion

The dashboard provides a clear view of the opportunity pipeline, highlighting expected revenue, conversion performance, industry contribution, lead sources, and win/loss trends. It helps identify key revenue opportunities and areas of opportunity loss, supporting data-driven sales and business decisions.

