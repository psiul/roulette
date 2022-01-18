select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,household_demographics hd,customer c,warehouse w
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 211 and cs.cs_hash <= 961 and d.d_hash >= 408 and d.d_hash <= 808 and hd.hd_hash >= 639 and hd.hd_hash <= 972
;
