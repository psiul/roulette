select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,catalog_returns cr,household_demographics hd,date_dim d
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cr.cr_returned_date_sk = d.d_date_sk and cs.cs_hash >= 222 and cs.cs_hash <= 972 and hd.hd_hash >= 548 and hd.hd_hash <= 948 and d.d_hash >= 329 and d.d_hash <= 662
;
