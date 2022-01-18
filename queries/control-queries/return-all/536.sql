select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,ship_mode sm,catalog_returns cr,item i
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_order_number = cr.cr_order_number and cr.cr_item_sk = i.i_item_sk and cs.cs_hash >= 273 and cs.cs_hash <= 606 and d.d_hash >= 262 and d.d_hash <= 662 and sm.sm_hash >= 10 and sm.sm_hash <= 760
;
