select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,catalog_returns cr,customer c,item i
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_order_number = cr.cr_order_number and cr.cr_refunded_customer_sk = c.c_customer_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_hash >= 88 and cs.cs_hash <= 488 and sm.sm_hash >= 157 and sm.sm_hash <= 490 and i.i_hash >= 166 and i.i_hash <= 916
;
