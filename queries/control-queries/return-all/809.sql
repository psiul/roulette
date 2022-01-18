select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,item i,catalog_returns cr,ship_mode sm
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_hash >= 344 and cs.cs_hash <= 744 and d.d_hash >= 552 and d.d_hash <= 885 and i.i_hash >= 85 and i.i_hash <= 835
;
