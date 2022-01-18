select count(cs.cs_item_sk)
from catalog_sales cs,item i,date_dim d,customer c,ship_mode sm
where cs.cs_item_sk = i.i_item_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and d.d_hash >= 315 and d.d_hash <= 648 and c.c_hash >= 292 and c.c_hash <= 692 and sm.sm_hash >= 240 and sm.sm_hash <= 990
;
