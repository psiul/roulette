select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,date_dim d,household_demographics hd,catalog_returns cr
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_hash >= 194 and cs.cs_hash <= 944 and d.d_hash >= 291 and d.d_hash <= 624 and hd.hd_hash >= 61 and hd.hd_hash <= 461
;
