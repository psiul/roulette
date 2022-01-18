select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,household_demographics hd,catalog_returns cr,warehouse w
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 312 and cs.cs_hash <= 712 and d.d_hash >= 152 and d.d_hash <= 902 and hd.hd_hash >= 332 and hd.hd_hash <= 665
;
