select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,catalog_returns cr,date_dim d,item i
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_ship_date_sk = d.d_date_sk and cr.cr_item_sk = i.i_item_sk and cs.cs_hash >= 278 and cs.cs_hash <= 611 and sm.sm_hash >= 231 and sm.sm_hash <= 981 and i.i_hash >= 523 and i.i_hash <= 923
;
