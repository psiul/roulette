select count(cs.cs_item_sk)
from catalog_sales cs,item i,customer c,ship_mode sm,date_dim d
where cs.cs_item_sk = i.i_item_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_hash >= 609 and cs.cs_hash <= 942 and sm.sm_hash >= 22 and sm.sm_hash <= 772 and d.d_hash >= 360 and d.d_hash <= 760
;
