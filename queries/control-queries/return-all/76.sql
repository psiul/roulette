select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,warehouse w,household_demographics hd,date_dim d
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_hash >= 128 and cs.cs_hash <= 461 and cd.cd_hash >= 244 and cd.cd_hash <= 994 and d.d_hash >= 456 and d.d_hash <= 856
;
