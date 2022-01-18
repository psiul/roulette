select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,item i,ship_mode sm,catalog_returns cr
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_order_number = cr.cr_order_number and d.d_hash >= 182 and d.d_hash <= 932 and i.i_hash >= 340 and i.i_hash <= 740 and sm.sm_hash >= 477 and sm.sm_hash <= 810
;
