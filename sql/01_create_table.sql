-- PostgreSQL-compatible analytical table definition.
-- The original row-level source data is intentionally not included in the public repo.

CREATE TABLE vehicle_inventory_clean (
    vehicle_id              VARCHAR(20) PRIMARY KEY,
    stock_number            VARCHAR(40),
    model_year              INTEGER,
    color                   VARCHAR(30),
    make                    VARCHAR(60),
    model                   VARCHAR(120),
    vin_masked              VARCHAR(40),
    mileage_km              INTEGER,
    selling_price_cad       NUMERIC(12,2),
    price_change_cad        NUMERIC(12,2),
    availability            BOOLEAN,
    carfax_status           VARCHAR(30),
    operations_status       VARCHAR(40),
    salesperson             VARCHAR(40),
    sold_flag               BOOLEAN,
    ownership_copy          BOOLEAN,
    vehicle_age             INTEGER,
    price_band              VARCHAR(30),
    mileage_band            VARCHAR(30),
    readiness_score         INTEGER,
    readiness_status        VARCHAR(30),
    data_quality_status     VARCHAR(50),
    price_change_review     VARCHAR(30),
    make_avg_price          NUMERIC(12,2),
    price_variance_vs_make  NUMERIC(12,2),
    price_variance_pct      NUMERIC(12,6),
    pricing_exception       VARCHAR(30),
    risk_score              INTEGER,
    risk_level              VARCHAR(30)
);

CREATE INDEX idx_vehicle_make ON vehicle_inventory_clean(make);
CREATE INDEX idx_vehicle_salesperson ON vehicle_inventory_clean(salesperson);
CREATE INDEX idx_vehicle_readiness ON vehicle_inventory_clean(readiness_status);
CREATE INDEX idx_vehicle_risk ON vehicle_inventory_clean(risk_level);
