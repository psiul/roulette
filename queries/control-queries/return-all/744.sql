select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,ship_mode sm,catalog_returns cr,customer c
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_bill_customer_sk = c.c_customer_sk and d.d_hash >= 439 and d.d_hash <= 839 and sm.sm_hash >= 108 and sm.sm_hash <= 858 and c.c_hash >= 506 and c.c_hash <= 839
;
