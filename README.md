The Bright Coffee Shop Sales Analysis is an end-to-end data analytics project designed to help the newly appointed CEO drive revenue growth, improve product performance, and optimize business operations. Acting as a Junior Data Analyst, the task was to transform raw transactional data into high-level, executive insights.

## Tools Used:  

The project was executed using an enterprise-grade data stack across architecture, processing, visualization, and presentation layers:  
* Miro: Data flow, ETL architecture planning, and project mapping.  
* Databricks (SQL): Data ingestion, schema correction, and ETL transformation.  
* Microsoft Excel: Pivot tables & data aggregation  
* Microsoft PowerPoint: Executive presentation of insights and strategic recommendations to the CEO.

## Methodology & Pipeline:  

The project was structured across four distinct phases to ensure data integrity and clear strategic reporting:
* Planning & Architecture (Miro): Designed a comprehensive Data Flow Diagram tracking data from its raw source through an ETL pipeline into storage and downstream visualization tools.  Outlined core business metrics, KPIs, and required conditional logic before writing code.
* Heavy Data Processing (Databricks): Ingested the raw dataset and handled schema validation.  Data Cleansing: Cleaned formatting anomalies in the price column, such as casting string values with European comma decimals (e.g., '3,1' to 3.1) into true float values.  Feature Engineering: Created calculated fields including total_amount ($unit\_price \times transaction\_qty$) and engineered a time-based feature transaction_time_bucket to map specific timestamps into Morning, Afternoon, and Evening shifts.
* Aggregation & Dashboarding (Excel): Exported clean data to build pivot tables and dynamic charts.  Visualized high-level metrics across location performance, temporal demand, and basket sizing.  

