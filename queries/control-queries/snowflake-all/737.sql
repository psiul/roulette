select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,ship_mode sm,item i,customer c
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 213 and cs.cs_hash <= 546 and i.i_hash >= 197 and i.i_hash <= 947 and c.c_hash >= 594 and c.c_hash <= 994
;
