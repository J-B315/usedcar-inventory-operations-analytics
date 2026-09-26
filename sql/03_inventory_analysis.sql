-- Executive inventory KPIs
SELECT
    COUNT(DISTINCT vehicle_id) AS total_vehicles,
    COUNT(DISTINCT vehicle_id) FILTER (WHERE availability = TRUE) AS available_vehicles,
    ROUND(AVG(selling_price_cad), 2) AS average_selling_price,
    ROUND(SUM(selling_price_cad) FILTER (WHERE availability = TRUE), 2) AS available_inventory_value,
    ROUND(AVG(mileage_km), 0) AS average_mileage_km
FROM vehicle_inventory_clean;

-- Inventory by make
SELECT
    make,
    COUNT(*) AS vehicle_count,
    ROUND(AVG(selling_price_cad), 2) AS average_selling_price,
    ROUND(SUM(selling_price_cad) FILTER (WHERE availability = TRUE), 2) AS available_inventory_value
FROM vehicle_inventory_clean
GROUP BY make
ORDER BY vehicle_count DESC, make;

-- Inventory by price band
SELECT
    price_band,
    COUNT(*) AS vehicle_count,
    ROUND(SUM(selling_price_cad), 2) AS listed_value
FROM vehicle_inventory_clean
GROUP BY price_band
ORDER BY
    CASE price_band
        WHEN 'Under $30K' THEN 1
        WHEN '$30K-$49,999' THEN 2
        WHEN '$50K-$79,999' THEN 3
        WHEN '$80K+' THEN 4
        ELSE 5
    END;
