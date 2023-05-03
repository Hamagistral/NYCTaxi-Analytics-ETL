/* This Query is used inside BigQuery to create an Analytics Table based on the Fact and Dimensions Table */

CREATE OR REPLACE TABLE `nyctaxi-etl.nyctaxi_dataset.analytics_table` AS (
        SELECT f.VendorID,
            d.tpep_pickup_datetime,
            d.tpep_dropoff_datetime,
            p.passenger_count,
            t.trip_distance,
            r.rate_code_name,
            pu.pickup_latitude,
            pu.pickup_longitude,
            drop.dropoff_latitude,
            drop.dropoff_longitude,
            pay.payment_type_name,
            f.fare_amount,
            f.extra,
            f.mta_tax,
            f.tip_amount,
            f.tolls_amount,
            f.improvement_surcharge,
            f.total_amount
            
        FROM `nyctaxi-etl.nyctaxi_dataset.fact_table` f
            JOIN `nyctaxi-etl.nyctaxi_dataset.datetime_dim` d ON f.datetime_id = d.datetime_id
            JOIN `nyctaxi-etl.nyctaxi_dataset.passenger_count_dim` p ON p.passenger_count_id = f.passenger_count_id
            JOIN `nyctaxi-etl.nyctaxi_dataset.trip_distance_dim` t ON t.trip_distance_id = f.trip_distance_id
            JOIN `nyctaxi-etl.nyctaxi_dataset.rate_code_dim` r ON r.rate_code_id = f.rate_code_id
            JOIN `nyctaxi-etl.nyctaxi_dataset.pickup_location_dim` pu ON pu.pickup_location_id = f.pickup_location_id
            JOIN `nyctaxi-etl.nyctaxi_dataset.dropoff_location_dim` drop ON drop.dropoff_location_id = f.dropoff_location_id
            JOIN `nyctaxi-etl.nyctaxi_dataset.payment_type_dim` pay ON pay.payment_type_id = f.payment_type_id
    );