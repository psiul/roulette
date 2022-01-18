select count(cs.cs_item_sk)
from catalog_sales cs,customer c,item i,household_demographics hd,warehouse w
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 431 and cs.cs_hash <= 831 and i.i_hash >= 133 and i.i_hash <= 883 and hd.hd_hash >= 280 and hd.hd_hash <= 613
;
