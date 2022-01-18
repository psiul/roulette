select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,household_demographics hd,warehouse w,customer c
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 195 and cs.cs_hash <= 945 and d.d_hash >= 398 and d.d_hash <= 798 and c.c_hash >= 197 and c.c_hash <= 530
;
