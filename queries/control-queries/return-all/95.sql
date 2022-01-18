select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,warehouse w,catalog_returns cr,date_dim d
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_hash >= 128 and cs.cs_hash <= 461 and hd.hd_hash >= 74 and hd.hd_hash <= 824 and d.d_hash >= 234 and d.d_hash <= 634
;
