select count(cs.cs_item_sk)
from catalog_sales cs,item i,ship_mode sm,date_dim d,customer c
where cs.cs_item_sk = i.i_item_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 47 and cs.cs_hash <= 380 and i.i_hash >= 242 and i.i_hash <= 992 and c.c_hash >= 570 and c.c_hash <= 970
;
