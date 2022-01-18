select count(cs.cs_item_sk)
from catalog_sales cs,customer c,ship_mode sm,date_dim d,household_demographics hd
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 415 and cs.cs_hash <= 748 and sm.sm_hash >= 140 and sm.sm_hash <= 890 and d.d_hash >= 532 and d.d_hash <= 932
;
