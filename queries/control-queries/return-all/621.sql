select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,date_dim d,catalog_returns cr,household_demographics hd
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 230 and cs.cs_hash <= 980 and d.d_hash >= 376 and d.d_hash <= 709 and hd.hd_hash >= 577 and hd.hd_hash <= 977
;
