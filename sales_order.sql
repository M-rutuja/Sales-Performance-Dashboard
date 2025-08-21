SELECT 
    order_id,
    country,
    order_value_eur,
    cost,
    category,
    customer_name,
    sales_manager,
    sales_rep,
    device_type,
    COALESCE(TO_CHAR(date, 'YYYY-MM-DD'), 'Pending') AS date_status
FROM sales_orders;



CREATE OR REPLACE VIEW sales_orders_with_status AS
SELECT 
    order_id,
    country,
    order_value_eur,
    cost,
    category,
    customer_name,
    sales_manager,
    sales_rep,
    device_type,
    COALESCE(TO_CHAR(date, 'YYYY-MM-DD'), 'Pending') AS date_status
FROM sales_orders;


SELECT 
    *,
    CASE 
        WHEN date IS NULL THEN 'Pending'
        ELSE TO_CHAR(date, 'YYYY-MM-DD')
    END AS date_status
FROM sales_orders;








