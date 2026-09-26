-- Make-level pricing benchmark
WITH make_benchmark AS (
    SELECT
        make,
        AVG(selling_price_cad) AS avg_make_price
    FROM vehicle_inventory_clean
    WHERE selling_price_cad IS NOT NULL
    GROUP BY make
)
SELECT
    v.vehicle_id,
    v.model_year,
    v.make,
    v.model,
    v.mileage_km,
    v.selling_price_cad,
    ROUND(b.avg_make_price, 2) AS avg_make_price,
    ROUND(v.selling_price_cad - b.avg_make_price, 2) AS price_variance_cad,
    ROUND(
        (v.selling_price_cad - b.avg_make_price)
        / NULLIF(b.avg_make_price, 0),
        4
    ) AS price_variance_pct,
    CASE
        WHEN v.selling_price_cad IS NULL THEN 'Missing Price'
        WHEN (v.selling_price_cad - b.avg_make_price) / NULLIF(b.avg_make_price, 0) >= 0.30 THEN 'High Price'
        WHEN (v.selling_price_cad - b.avg_make_price) / NULLIF(b.avg_make_price, 0) <= -0.30 THEN 'Low Price'
        ELSE 'Within Range'
    END AS pricing_exception
FROM vehicle_inventory_clean v
LEFT JOIN make_benchmark b
    ON v.make = b.make
ORDER BY ABS(
    (v.selling_price_cad - b.avg_make_price)
    / NULLIF(b.avg_make_price, 0)
) DESC NULLS LAST;

-- Rank vehicles by price within make
SELECT
    vehicle_id,
    make,
    model,
    selling_price_cad,
    DENSE_RANK() OVER (
        PARTITION BY make
        ORDER BY selling_price_cad DESC NULLS LAST
    ) AS price_rank_within_make
FROM vehicle_inventory_clean;
