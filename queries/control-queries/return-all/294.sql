select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,warehouse w,item i,catalog_returns cr
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_hash >= 122 and cs.cs_hash <= 872 and hd.hd_hash >= 92 and hd.hd_hash <= 492 and i.i_hash >= 10 and i.i_hash <= 343
;
