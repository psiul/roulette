select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,warehouse w,date_dim d,catalog_returns cr
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_hash >= 197 and cs.cs_hash <= 597 and hd.hd_hash >= 226 and hd.hd_hash <= 976 and d.d_hash >= 282 and d.d_hash <= 615
;
