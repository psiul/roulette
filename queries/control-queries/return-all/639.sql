select count(cs.cs_item_sk)
from catalog_sales cs,item i,ship_mode sm,date_dim d,catalog_returns cr
where cs.cs_item_sk = i.i_item_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_hash >= 530 and cs.cs_hash <= 863 and sm.sm_hash >= 142 and sm.sm_hash <= 542 and d.d_hash >= 108 and d.d_hash <= 858
;
