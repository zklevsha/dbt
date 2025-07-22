with CTE as (
    select 
        TO_TIMESTAMP(started_at) as started_at_ts,
        DATE(started_at_ts) as date_started_at,
        HOUR(started_at_ts) as hour_started_at,
        {{ get_buisnes_or_weekend_day('started_at_ts') }} as type_of_day,
        {{ get_season('started_at_ts') }} as station_of_year
    
    from {{ source('demo', 'bike') }}
    where started_at != 'started_at'
)

select * from CTE