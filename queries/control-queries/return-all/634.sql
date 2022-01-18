select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,catalog_returns cr,date_dim d,customer c
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 24 and cs.cs_hash <= 774 and sm.sm_hash >= 442 and sm.sm_hash <= 842 and c.c_hash >= 138 and c.c_hash <= 471
;
