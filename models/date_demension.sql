with CTE as (
    select 
        TO_TIMESTAMP(started_at) as started_at_ts,
        DATE(started_at_ts) as date_started_at,
        HOUR(started_at_ts) as hour_started_at,
    
        case
            when DAYNAME(started_at_ts) in ('Sat', 'Sun') then 'WEEKEND'
            else 'BUISNESSDAY'
        end as type_of_day,

        case 
            when MONTH(started_at_ts) in (12,1,2) then 'WINTER'
            when MONTH(started_at_ts) in (3,4,5) then 'SPRING'
            when MONTH(started_at_ts) in (6,7,8) then 'SUMMER'
            else 'AUTUM' 
        end as station_of_year
    
    from {{ source('demo', 'bike') }}
    where started_at != 'started_at'
)

select * from CTE