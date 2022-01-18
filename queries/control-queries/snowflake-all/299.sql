select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,date_dim d,customer c,warehouse w
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 151 and cs.cs_hash <= 901 and d.d_hash >= 420 and d.d_hash <= 753 and c.c_hash >= 134 and c.c_hash <= 534
;
