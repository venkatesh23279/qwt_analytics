import snowflake.snowpark.functions as F 

def model(dbt,session):
        dbt.config(materialized='incremental',unique_key=['orderid'])
        order_df=dbt.source("raw_qwt",'raw_orders')
        if dbt.is_incremental:
           max_order_date= f"select max(orderdate) from {dbt.this}"
           order.df = order_df.filter(orders_df.orderdate>session.sql(max_order_date).collect()[0][0])
        return order_df