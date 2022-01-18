select count(cs.cs_item_sk)
from catalog_sales cs,catalog_returns cr,ship_mode sm,date_dim d,customer c
where cs.cs_order_number = cr.cr_order_number and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_sold_date_sk = d.d_date_sk and cr.cr_refunded_customer_sk = c.c_customer_sk and cs.cs_hash >= 196 and cs.cs_hash <= 946 and d.d_hash >= 528 and d.d_hash <= 928 and c.c_hash >= 2 and c.c_hash <= 335
;
