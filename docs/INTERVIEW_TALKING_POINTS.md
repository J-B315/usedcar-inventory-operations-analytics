# Interview Talking Points

## 30-second project summary

I built an end-to-end Power BI solution from a real operational used-vehicle inventory workbook. I used Power Query to clean and standardize the source, created a vehicle-grain analytical model with reusable dimensions, built DAX KPIs and rule-based readiness/pricing/risk logic, and designed three management pages plus tooltip and drill-through experiences. The goal was to turn an operational spreadsheet into a report that helps management identify inventory value, readiness bottlenecks, data-quality issues, pricing exceptions, and vehicles that need follow-up.

## Why the model is structured this way

The grain of `Vehicle_Clean` is one row per vehicle. Reusable descriptive attributes such as make and salesperson were separated into dimensions so they can filter the vehicle table through one-to-many relationships. Measure-only and field-parameter tables remain disconnected because they do not represent business entities.

## Why use measures instead of only calculated columns

Measures are evaluated in filter context and are therefore reusable across make, salesperson, year, readiness, and other slicers. Calculated columns are used only where a row-level classification is needed, such as pricing exception or risk level.

## Readiness logic

Readiness is a transparent rule-based operational metric, not a predictive model. It combines the presence of Carfax information, ownership documentation, completed preparation status, and salesperson assignment.

## Pricing logic

The report compares each vehicle with the average price for its make and flags large percentage deviations for manual review. I deliberately describe those records as exceptions rather than errors because model year, trim, condition, and market context can legitimately explain a large difference.

## Data-quality approach

Instead of deleting every questionable row, I created review statuses. This preserves operational records while making uncertainty visible to report users.

## Important limitation

The source did not contain a reliable inventory-entry/acquisition date, so I did not fabricate inventory aging. I would add days-on-lot analysis once a trustworthy date field becomes available.
