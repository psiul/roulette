select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,catalog_returns cr,warehouse w,household_demographics hd
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_warehouse_sk = w.w_warehouse_sk and cr.cr_refunded_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 382 and cs.cs_hash <= 782 and d.d_hash >= 90 and d.d_hash <= 840 and hd.hd_hash >= 149 and hd.hd_hash <= 482
;
