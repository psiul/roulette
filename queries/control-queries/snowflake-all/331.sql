select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,ship_mode sm,customer c,household_demographics hd
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 107 and d.d_hash <= 440 and sm.sm_hash >= 314 and sm.sm_hash <= 714 and hd.hd_hash >= 182 and hd.hd_hash <= 932
;
