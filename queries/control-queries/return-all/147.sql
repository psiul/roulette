select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,date_dim d,catalog_returns cr,household_demographics hd
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_order_number = cr.cr_order_number and cr.cr_refunded_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 195 and cs.cs_hash <= 945 and d.d_hash >= 256 and d.d_hash <= 589 and hd.hd_hash >= 561 and hd.hd_hash <= 961
;
