select count(cs.cs_item_sk)
from catalog_sales cs,item i,date_dim d,customer c,ship_mode sm
where cs.cs_item_sk = i.i_item_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and i.i_hash >= 191 and i.i_hash <= 941 and c.c_hash >= 489 and c.c_hash <= 889 and sm.sm_hash >= 49 and sm.sm_hash <= 382
;
