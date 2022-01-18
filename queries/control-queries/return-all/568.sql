select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,household_demographics hd,item i,catalog_returns cr
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_hash >= 200 and cs.cs_hash <= 600 and hd.hd_hash >= 39 and hd.hd_hash <= 789 and i.i_hash >= 342 and i.i_hash <= 675
;
