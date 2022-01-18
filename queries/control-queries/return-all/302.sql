select count(cs.cs_item_sk)
from catalog_sales cs,item i,date_dim d,ship_mode sm,customer c
where cs.cs_item_sk = i.i_item_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_customer_sk = c.c_customer_sk and i.i_hash >= 187 and i.i_hash <= 937 and sm.sm_hash >= 75 and sm.sm_hash <= 408 and c.c_hash >= 392 and c.c_hash <= 792
;
