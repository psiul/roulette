select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,warehouse w,customer c,item i
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_hash >= 416 and cs.cs_hash <= 749 and c.c_hash >= 71 and c.c_hash <= 821 and i.i_hash >= 420 and i.i_hash <= 820
;
