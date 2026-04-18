{{ config(materialized='table') }}

{% set configs = [
    {
        "table": "AIRBNB.GOLD.OBT",
        "columns": "GOLD_obt.BOOKING_ID, GOLD_obt.LISTING_ID, GOLD_obt.HOST_ID, GOLD_obt.TOTAL_AMOUNT, GOLD_obt.SERVICE_FEE, GOLD_obt.CLEANING_FEE, GOLD_obt.ACCOMMODATES, GOLD_obt.BEDROOMS, GOLD_obt.BATHROOMS, GOLD_obt.PRICE_PER_NIGHT, GOLD_obt.RESPONSE_RATE",
        "alias": "GOLD_obt"
    },
    {
        "table": "AIRBNB.GOLD.DIM_LISTINGS",
        "columns": "DIM_listings.PROPERTY_TYPE, DIM_listings.ROOM_TYPE, DIM_listings.CITY, DIM_listings.COUNTRY, DIM_listings.PRICE_PER_NIGHT_TAG, DIM_listings.LISTING_CREATED_AT",
        "alias": "DIM_listings",
        "join_condition": "GOLD_obt.listing_id = DIM_listings.listing_id"
    },
    {
        "table": "AIRBNB.GOLD.DIM_HOSTS",
        "columns": "DIM_hosts.HOST_NAME, DIM_hosts.HOST_SINCE, DIM_hosts.IS_SUPERHOST, DIM_hosts.RESPONSE_RATE_QUALITY, DIM_hosts.HOST_CREATED_AT",
        "alias": "DIM_hosts",
        "join_condition": "GOLD_obt.host_id = DIM_hosts.host_id"
    }
] %}

SELECT
{% for config in configs %}
    {{ config['columns'] }}{% if not loop.last %},{% endif %}
{% endfor %}
FROM
{% for config in configs %}
    {% if loop.first %}
        {{ config['table'] }} AS {{ config['alias'] }}
    {% else %}
        LEFT JOIN {{ config['table'] }} AS {{ config['alias'] }}
        ON {{ config['join_condition'] }}
    {% endif %}
{% endfor %}