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

## 🗂️ Data Model / Schema

The CRM Analytics project follows a Galaxy Schema (Fact Constellation Schema) with multiple fact tables sharing common dimension tables.

Fact Tables: fact_opportunity, fact_lead, fact_opp_product
Dimension Tables: dim_account, dim_user

This schema supports scalable CRM analysis, KPI calculation, and reporting.
