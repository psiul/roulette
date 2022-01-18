select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,ship_mode sm,customer c,item i
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_item_sk = i.i_item_sk and d.d_hash >= 567 and d.d_hash <= 967 and sm.sm_hash >= 562 and sm.sm_hash <= 895 and i.i_hash >= 31 and i.i_hash <= 781
;
