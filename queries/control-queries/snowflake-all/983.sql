select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,warehouse w,date_dim d,customer_demographics cd
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 398 and cs.cs_hash <= 731 and hd.hd_hash >= 580 and hd.hd_hash <= 980 and d.d_hash >= 66 and d.d_hash <= 816
;
