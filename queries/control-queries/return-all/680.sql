select count(cs.cs_item_sk)
from catalog_sales cs,catalog_returns cr,date_dim d,ship_mode sm,customer c
where cs.cs_order_number = cr.cr_order_number and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 452 and cs.cs_hash <= 852 and sm.sm_hash >= 400 and sm.sm_hash <= 733 and c.c_hash >= 142 and c.c_hash <= 892
;
