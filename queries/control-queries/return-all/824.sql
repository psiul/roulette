select count(cs.cs_item_sk)
from catalog_sales cs,catalog_returns cr,date_dim d,household_demographics hd,warehouse w
where cs.cs_order_number = cr.cr_order_number and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 592 and cs.cs_hash <= 925 and d.d_hash >= 492 and d.d_hash <= 892 and hd.hd_hash >= 112 and hd.hd_hash <= 862
;
