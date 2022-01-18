select count(cs.cs_item_sk)
from catalog_sales cs,item i,household_demographics hd,customer c,warehouse w
where cs.cs_item_sk = i.i_item_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and i.i_hash >= 310 and i.i_hash <= 710 and hd.hd_hash >= 201 and hd.hd_hash <= 951 and c.c_hash >= 563 and c.c_hash <= 896
;
