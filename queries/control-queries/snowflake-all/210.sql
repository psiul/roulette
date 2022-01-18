select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,date_dim d,customer c,household_demographics hd
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 47 and cs.cs_hash <= 447 and d.d_hash >= 2 and d.d_hash <= 752 and c.c_hash >= 159 and c.c_hash <= 492
;
