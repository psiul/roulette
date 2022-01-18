select count(cs.cs_item_sk)
from catalog_sales cs,catalog_returns cr,item i,ship_mode sm,customer c
where cs.cs_order_number = cr.cr_order_number and cs.cs_item_sk = i.i_item_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cr.cr_refunded_customer_sk = c.c_customer_sk and cs.cs_hash >= 63 and cs.cs_hash <= 813 and i.i_hash >= 90 and i.i_hash <= 490 and sm.sm_hash >= 259 and sm.sm_hash <= 592
;
