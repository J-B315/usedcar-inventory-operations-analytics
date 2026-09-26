-- 1. Overall data-quality status
SELECT
    data_quality_status,
    COUNT(*) AS vehicle_count,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS pct_of_inventory
FROM vehicle_inventory_clean
GROUP BY data_quality_status
ORDER BY vehicle_count DESC;

-- 2. Records that require data-quality review
SELECT
    vehicle_id,
    model_year,
    make,
    model,
    mileage_km,
    selling_price_cad,
    data_quality_status,
    price_change_review
FROM vehicle_inventory_clean
WHERE data_quality_status <> 'Valid'
   OR price_change_review = 'Review'
ORDER BY
    CASE WHEN data_quality_status <> 'Valid' THEN 0 ELSE 1 END,
    vehicle_id;

-- 3. Missing analytical inputs
SELECT
    SUM(CASE WHEN model_year IS NULL THEN 1 ELSE 0 END) AS missing_model_year,
    SUM(CASE WHEN mileage_km IS NULL THEN 1 ELSE 0 END) AS missing_mileage,
    SUM(CASE WHEN selling_price_cad IS NULL THEN 1 ELSE 0 END) AS missing_price,
    SUM(CASE WHEN carfax_status = 'Missing' THEN 1 ELSE 0 END) AS missing_carfax
FROM vehicle_inventory_clean;
