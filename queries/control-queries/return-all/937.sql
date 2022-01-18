select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,catalog_returns cr,item i,ship_mode sm
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_order_number = cr.cr_order_number and cr.cr_item_sk = i.i_item_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and d.d_hash >= 1 and d.d_hash <= 751 and i.i_hash >= 131 and i.i_hash <= 531 and sm.sm_hash >= 92 and sm.sm_hash <= 425
;
