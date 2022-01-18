select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,warehouse w,household_demographics hd,customer_demographics cd
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 148 and cs.cs_hash <= 481 and d.d_hash >= 126 and d.d_hash <= 876 and hd.hd_hash >= 517 and hd.hd_hash <= 917
;
