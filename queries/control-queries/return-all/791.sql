select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,catalog_returns cr,date_dim d,household_demographics hd
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 137 and cs.cs_hash <= 537 and d.d_hash >= 83 and d.d_hash <= 833 and hd.hd_hash >= 158 and hd.hd_hash <= 491
;
