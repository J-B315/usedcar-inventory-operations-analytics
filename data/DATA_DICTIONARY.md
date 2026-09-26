# Data Dictionary

| Field | Type | Description |
|---|---|---|
| Vehicle_ID | Text | Anonymous unique key for one vehicle record. |
| Stock_Number | Text | Internal inventory stock reference when retained. |
| Model_Year | Whole number | Vehicle model year parsed from the source description. |
| Color | Text | Standardized exterior color. |
| Make | Text | Standardized vehicle manufacturer. |
| Model | Text | Parsed vehicle model / trim description. |
| VIN_Masked | Text | Public-safe vehicle reference; full VIN removed. |
| Mileage_km | Whole number | Standardized odometer mileage in kilometres. |
| Selling_Price_CAD | Currency | Current listed selling price in CAD. |
| Price_Change_CAD | Currency | Recorded price adjustment amount. |
| Availability | Boolean | Whether the vehicle is marked available. |
| Carfax_Status | Text | Standardized Carfax status such as Clean, Claimed, or Missing. |
| Operations_Status | Text | Operational preparation status such as Completed or Not Started. |
| Salesperson | Text | Anonymized salesperson assignment. |
| Sold_Flag | Boolean | Indicates whether a source record is marked sold. |
| Ownership_Copy | Boolean | Indicates whether ownership documentation is recorded. |
| Vehicle_Age | Whole number | Current analysis year minus model year. |
| Price_Band | Text | Price segmentation used in the dashboard. |
| Mileage_Band | Text | Mileage segmentation used in the dashboard. |
| Readiness_Score | Whole number | Rule-based 0-100 operational readiness score. |
| Readiness_Status | Text | Ready for Sale, Action Required, or Critical. |
| Data_Quality_Status | Text | Data validation / review result. |
| Price_Change_Review | Text | Flags questionable price-change values for review. |
| Make_Avg_Price | Currency | Average selling price for the current make. |
| Price_Variance_vs_Make | Currency | Difference between vehicle price and make average. |
| Price_Variance_Pct | Percentage | Price difference relative to make average. |
| Pricing_Exception | Text | High Price, Low Price, Within Range, or Missing Price. |
| Risk_Score | Whole number | Rule-based operational priority score. |
| Risk_Level | Text | High Priority, Medium Priority, or Low Priority. |

## Grain

**One row = one vehicle inventory record.**
