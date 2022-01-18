select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,ship_mode sm,item i,customer c
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 235 and cs.cs_hash <= 568 and sm.sm_hash >= 208 and sm.sm_hash <= 608 and c.c_hash >= 162 and c.c_hash <= 912
;
