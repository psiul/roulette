select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer c,household_demographics hd,ship_mode sm
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_hash >= 184 and cs.cs_hash <= 584 and d.d_hash >= 114 and d.d_hash <= 864 and sm.sm_hash >= 141 and sm.sm_hash <= 474
;
