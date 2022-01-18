select count(cs.cs_item_sk)
from catalog_sales cs,catalog_returns cr,ship_mode sm,customer c,date_dim d
where cs.cs_order_number = cr.cr_order_number and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_hash >= 170 and cs.cs_hash <= 920 and sm.sm_hash >= 2 and sm.sm_hash <= 335 and d.d_hash >= 55 and d.d_hash <= 455
;
