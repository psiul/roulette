select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,household_demographics hd,date_dim d,customer c
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 111 and cs.cs_hash <= 511 and hd.hd_hash >= 212 and hd.hd_hash <= 545 and d.d_hash >= 184 and d.d_hash <= 934
;
