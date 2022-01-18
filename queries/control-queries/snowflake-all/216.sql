select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,date_dim d,household_demographics hd,customer_demographics cd
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 18 and d.d_hash <= 768 and hd.hd_hash >= 383 and hd.hd_hash <= 783 and cd.cd_hash >= 340 and cd.cd_hash <= 673
;
