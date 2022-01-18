select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer_demographics cd,household_demographics hd,warehouse w
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and d.d_hash >= 523 and d.d_hash <= 923 and cd.cd_hash >= 42 and cd.cd_hash <= 792 and hd.hd_hash >= 374 and hd.hd_hash <= 707
;
