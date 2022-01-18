select count(cs.cs_item_sk)
from catalog_sales cs,item i,date_dim d,ship_mode sm,catalog_returns cr
where cs.cs_item_sk = i.i_item_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_hash >= 506 and cs.cs_hash <= 906 and d.d_hash >= 56 and d.d_hash <= 806 and sm.sm_hash >= 293 and sm.sm_hash <= 626
;
