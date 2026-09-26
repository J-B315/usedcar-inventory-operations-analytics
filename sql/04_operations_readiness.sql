-- Readiness distribution
SELECT
    readiness_status,
    COUNT(*) AS vehicle_count,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS pct_of_inventory
FROM vehicle_inventory_clean
GROUP BY readiness_status
ORDER BY
    CASE readiness_status
        WHEN 'Critical' THEN 1
        WHEN 'Action Required' THEN 2
        WHEN 'Ready for Sale' THEN 3
        ELSE 4
    END;

-- Readiness by salesperson
SELECT
    salesperson,
    COUNT(*) AS assigned_vehicle_count,
    SUM(CASE WHEN readiness_status = 'Ready for Sale' THEN 1 ELSE 0 END) AS ready_for_sale,
    SUM(CASE WHEN readiness_status = 'Action Required' THEN 1 ELSE 0 END) AS action_required,
    SUM(CASE WHEN readiness_status = 'Critical' THEN 1 ELSE 0 END) AS critical,
    ROUND(AVG(readiness_score), 1) AS average_readiness_score
FROM vehicle_inventory_clean
GROUP BY salesperson
ORDER BY assigned_vehicle_count DESC;

-- Operations action list
SELECT
    vehicle_id,
    model_year,
    make,
    model,
    salesperson,
    carfax_status,
    operations_status,
    ownership_copy,
    readiness_score,
    readiness_status,
    data_quality_status,
    risk_score,
    risk_level
FROM vehicle_inventory_clean
WHERE readiness_status <> 'Ready for Sale'
ORDER BY risk_score DESC, readiness_score ASC, vehicle_id;
