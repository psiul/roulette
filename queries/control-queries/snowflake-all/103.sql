select count(cs.cs_item_sk)
from catalog_sales cs,customer c,date_dim d,ship_mode sm,item i
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_item_sk = i.i_item_sk and c.c_hash >= 33 and c.c_hash <= 783 and d.d_hash >= 526 and d.d_hash <= 926 and sm.sm_hash >= 653 and sm.sm_hash <= 986
;
