{% macro get_season(ts) %}
    case 
        when MONTH({{ ts }}) in (12,1,2) then 'WINTER'
        when MONTH({{ ts }}) in (3,4,5) then 'SPRING'
        when MONTH({{ ts }}) in (6,7,8) then 'SUMMER'
        else 'AUTUM' 
    end 
{% endmacro %}

{% macro get_buisnes_or_weekend_day(ts) %}
    case
        when DAYNAME({{ ts }}) in ('Sat', 'Sun') then 'WEEKEND'
        else 'BUISNESSDAY'
    end
{% endmacro %}