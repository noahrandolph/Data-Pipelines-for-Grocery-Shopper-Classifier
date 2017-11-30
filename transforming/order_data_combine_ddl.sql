DROP TABLE
orders_for_analysis;

CREATE TABLE
orders_for_analysis AS
SELECT *
FROM dh_orders

UNION ALL

SELECT *
FROM i_orders;
