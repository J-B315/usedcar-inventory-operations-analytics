-- Recreate the rule-based operational priority score in SQL.
WITH scored AS (
    SELECT
        v.*,
        CASE readiness_status
            WHEN 'Critical' THEN 40
            WHEN 'Action Required' THEN 20
            WHEN 'Ready for Sale' THEN 0
            ELSE 10
        END
        + CASE WHEN data_quality_status <> 'Valid' THEN 20 ELSE 0 END
        + CASE pricing_exception
            WHEN 'High Price' THEN 15
            WHEN 'Low Price' THEN 10
            WHEN 'Missing Price' THEN 20
            ELSE 0
          END
        + CASE carfax_status
            WHEN 'Missing' THEN 15
            WHEN 'Claimed' THEN 10
            WHEN 'Clean' THEN 0
            ELSE 5
          END
        + CASE WHEN availability = TRUE THEN 0 ELSE 10 END AS calculated_risk_score
    FROM vehicle_inventory_clean v
), classified AS (
    SELECT
        *,
        CASE
            WHEN calculated_risk_score >= 60 THEN 'High Priority'
            WHEN calculated_risk_score >= 30 THEN 'Medium Priority'
            ELSE 'Low Priority'
        END AS calculated_risk_level
    FROM scored
)
SELECT
    vehicle_id,
    model_year,
    make,
    model,
    readiness_status,
    data_quality_status,
    pricing_exception,
    carfax_status,
    availability,
    calculated_risk_score,
    calculated_risk_level
FROM classified
ORDER BY calculated_risk_score DESC, vehicle_id;

-- Priority summary
WITH priority AS (
    SELECT
        CASE
            WHEN risk_score >= 60 THEN 'High Priority'
            WHEN risk_score >= 30 THEN 'Medium Priority'
            ELSE 'Low Priority'
        END AS risk_level_calc
    FROM vehicle_inventory_clean
)
SELECT
    risk_level_calc,
    COUNT(*) AS vehicle_count
FROM priority
GROUP BY risk_level_calc
ORDER BY
    CASE risk_level_calc
        WHEN 'High Priority' THEN 1
        WHEN 'Medium Priority' THEN 2
        ELSE 3
    END;
