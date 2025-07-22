WITH trips as (
    select 
    ride_id,
    rideable_type,
    DATE(TO_TIMESTAMP(started_at)) as trip_date,
    start_station_id,
    end_station_id,
    member_casual,
    TIMESTAMPDIFF(seconds, TO_TIMESTAMP(started_at), TO_TIMESTAMP(ended_at)) as trip_duration_seconds
    from {{ source('demo', 'bike') }}
    where ride_id != 'ride_id'
)

select * from trips