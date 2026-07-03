## Overview of the Case Study

Bright Coffee Shop recently appointed a new CEO whose mission is to grow company
revenue and improve product performance. As Junior Data Analyst, my task was to
examine six months of daily transactional sales data (January – May 2023) across
the company's three New York store locations — Astoria, Hell's Kitchen, and Lower
Manhattan — and turn it into actionable insights and recommendations for the CEO.

The objective was to answer four core business questions:
- Which products generate the most revenue?
- What time of day does the store perform best?
- What are the sales trends across products and time intervals?
- What recommendations can improve sales performance?

## Methodology & Pipeline:  

1. **Data intake** — Received the raw "Bright Coffee Shop Sales" export from the
   Sales Department's internal CRM: 20 columns and 149,117 rows of transaction-level
   data (transaction id, date/time, store, product, unit price, quantity, etc.).
2. **Data cleaning** — Fixed a formatting issue in the `unit_price` column where
   decimals were written with a comma instead of a dot (e.g. `'3,1'` → `3.1`), then
   converted the column from text to a numeric data type.
3. **Feature engineering** — Built the analysis columns needed to answer the
   business questions:
   - `time_bucket` — grouped each transaction into Morning / Afternoon / Evening
   - `spend_bucket` — grouped transactions into Cheap / Medium / Expensive spend
   - `day_type` — Weekday vs. Weekend
   - `revenue_per_row` — `clean_unit_price × transaction_qty`
   - Converted raw timestamps into the date/time formats needed for analysis
4. **Analysis** — Built pivot tables and charts on the cleaned dataset to summarise
   revenue by store location, by product category, by month, by time of day, and by
   day of week.
5. **Presentation** — Packaged the findings, visuals, and recommendations into a
   PowerPoint presentation for the CEO.

## Key Insights

- **Total revenue:** $698,812.33 from **214,470 units sold**, at an average revenue
  of $4.68 per transaction line. **Barista Espresso** was the single best-selling
  product.
- **Store performance is nearly even**, but Hell's Kitchen edges out the other two
  locations by just over 1% of total revenue (33% Astoria / 34% Hell's Kitchen /
  33% Lower Manhattan) — suggesting untapped growth potential in the other stores'
  local markets, especially wealthier neighbourhoods that could support
  higher-priced products.
- **Coffee is the top-selling product category**, followed by Tea and then Bakery.
  Packaged Chocolate generated the fewest sales, indicating an opportunity to
  broaden the coffee, tea, and bakery ranges.
- **Revenue grew steadily month over month**, rising from ~$82K in January to a
  peak of ~$166K in June — the strongest month in the six-month window.
- **Mornings drive the most revenue** at every location except Astoria, where
  afternoons perform best; evenings are consistently the slowest period across all
  three stores.
- **Weekdays significantly outsell weekends** — 72% of units were sold on
  weekdays vs. 28% on weekends.

  ## Recommendations

- Launch targeted marketing campaigns to lift sales during slow periods (evenings
  and the January–February dip).
- Introduce menu items that can be enjoyed at any time of day to grow afternoon
  and evening revenue.
- Run winter-season promotions to build on the existing upward revenue trend.
- Introduce higher-priced/premium products in more affluent neighbourhoods to
  close the store-location revenue gap.
- Expand product variety within the best-performing categories (coffee, tea,
  bakery) to drive further unit sales.

## Tools Used

| Stage | Tool |
|---|---|
| Data flow/architecture diagram & Gantt chart | Miro/ Microsoft Excel |
| Data cleaning & transformation | Databricks |
| Feature engineering | Databricks |
| Analysis (pivot tables & charts) | Microsoft Excel |
| Final presentation | Microsoft PowerPoint |



