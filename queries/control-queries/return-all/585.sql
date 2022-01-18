select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,catalog_returns cr,warehouse w,date_dim d
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_warehouse_sk = w.w_warehouse_sk and cr.cr_returned_date_sk = d.d_date_sk and cs.cs_hash >= 245 and cs.cs_hash <= 995 and hd.hd_hash >= 593 and hd.hd_hash <= 926 and d.d_hash >= 155 and d.d_hash <= 555
;
