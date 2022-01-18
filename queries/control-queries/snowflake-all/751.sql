select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,household_demographics hd,warehouse w,customer_demographics cd
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 197 and d.d_hash <= 530 and hd.hd_hash >= 24 and hd.hd_hash <= 774 and cd.cd_hash >= 433 and cd.cd_hash <= 833
;
