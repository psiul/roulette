select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,ship_mode sm,catalog_returns cr,item i
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_item_sk = i.i_item_sk and d.d_hash >= 135 and d.d_hash <= 885 and sm.sm_hash >= 572 and sm.sm_hash <= 905 and i.i_hash >= 461 and i.i_hash <= 861
;
