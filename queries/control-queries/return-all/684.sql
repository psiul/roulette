select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,warehouse w,date_dim d,household_demographics hd
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 588 and cs.cs_hash <= 988 and d.d_hash >= 327 and d.d_hash <= 660 and hd.hd_hash >= 59 and hd.hd_hash <= 809
;
