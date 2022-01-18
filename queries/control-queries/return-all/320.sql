select count(cs.cs_item_sk)
from catalog_sales cs,item i,ship_mode sm,date_dim d,catalog_returns cr
where cs.cs_item_sk = i.i_item_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_order_number = cr.cr_order_number and i.i_hash >= 66 and i.i_hash <= 816 and sm.sm_hash >= 575 and sm.sm_hash <= 908 and d.d_hash >= 15 and d.d_hash <= 415
;
