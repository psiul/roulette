select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,customer c,household_demographics hd,item i
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_hash >= 356 and cs.cs_hash <= 689 and c.c_hash >= 191 and c.c_hash <= 941 and hd.hd_hash >= 278 and hd.hd_hash <= 678
;
