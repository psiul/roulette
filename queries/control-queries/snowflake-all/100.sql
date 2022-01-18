select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,ship_mode sm,customer c,item i
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_hash >= 66 and cs.cs_hash <= 399 and d.d_hash >= 470 and d.d_hash <= 870 and sm.sm_hash >= 102 and sm.sm_hash <= 852
;
