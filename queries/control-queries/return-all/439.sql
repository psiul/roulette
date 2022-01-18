select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,item i,date_dim d,customer c
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and sm.sm_hash >= 99 and sm.sm_hash <= 499 and i.i_hash >= 115 and i.i_hash <= 865 and d.d_hash >= 650 and d.d_hash <= 983
;
