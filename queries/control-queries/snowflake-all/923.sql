select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,customer c,item i,date_dim d
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_hash >= 559 and cs.cs_hash <= 959 and sm.sm_hash >= 188 and sm.sm_hash <= 938 and i.i_hash >= 156 and i.i_hash <= 489
;
