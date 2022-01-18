select count(cs.cs_item_sk)
from catalog_sales cs,customer c,household_demographics hd,item i,warehouse w
where cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 188 and cs.cs_hash <= 521 and hd.hd_hash >= 107 and hd.hd_hash <= 857 and i.i_hash >= 143 and i.i_hash <= 543
;
