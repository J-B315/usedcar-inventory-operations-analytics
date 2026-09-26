# Power Query Transformation Workflow

The final report was built from a structured cleaning workflow rather than direct visualizations on the raw operational sheet.

## 1. Source staging

- Connect to the operational Excel source.
- Keep the raw/staging query out of the final report model (`Enable Load` off).
- Filter out non-vehicle blank rows.

## 2. Standardize columns

- Rename inconsistent source headers.
- Trim and clean text.
- Set explicit data types.

## 3. Parse vehicle description

- Extract model year.
- Detect standardized color values.
- Match make against a controlled make list.
- Treat the remaining text as model/trim description.

## 4. Clean numeric fields

- Remove separators and notes from mileage.
- Convert selling price to a numeric CAD field.
- Parse price-change values and flag questionable records rather than silently assuming they are correct.

## 5. Standardize operational fields

- Convert availability, sold, and ownership-copy flags to logical values.
- Standardize Carfax status.
- Standardize operations status.
- Replace direct employee identifiers with anonymized salesperson labels.

## 6. Privacy transformations

- Remove full VIN from the analytical output.
- Create a masked VIN reference.
- Remove employee email addresses and Carfax URLs from the public-facing model.

## 7. Derived analytical fields

- Vehicle age
- Price band
- Mileage band
- Readiness score / status
- Data-quality status
- Price-change review flag
- Make-level average price
- Price variance / percentage variance
- Pricing exception
- Risk score / risk level

## 8. Final model load

- Load `Vehicle_Clean`, `Dim_Make`, and `Dim_Salesperson`.
- Keep staging queries disabled from load.
- Use single-direction one-to-many relationships from dimensions to the vehicle table.
