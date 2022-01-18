select count(cs.cs_item_sk)
from catalog_sales cs,catalog_returns cr,item i,date_dim d,ship_mode sm
where cs.cs_order_number = cr.cr_order_number and cs.cs_item_sk = i.i_item_sk and cr.cr_returned_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_hash >= 597 and cs.cs_hash <= 997 and d.d_hash >= 122 and d.d_hash <= 455 and sm.sm_hash >= 73 and sm.sm_hash <= 823
;
