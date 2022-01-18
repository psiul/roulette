select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,item i,catalog_returns cr,customer c
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 236 and cs.cs_hash <= 636 and sm.sm_hash >= 201 and sm.sm_hash <= 951 and c.c_hash >= 400 and c.c_hash <= 733
;
