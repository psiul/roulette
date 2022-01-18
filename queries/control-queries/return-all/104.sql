select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,ship_mode sm,customer c,catalog_returns cr
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_order_number = cr.cr_order_number and d.d_hash >= 3 and d.d_hash <= 753 and sm.sm_hash >= 504 and sm.sm_hash <= 904 and c.c_hash >= 608 and c.c_hash <= 941
;
