select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,household_demographics hd,warehouse w,customer_demographics cd
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 421 and cs.cs_hash <= 821 and hd.hd_hash >= 184 and hd.hd_hash <= 517 and cd.cd_hash >= 161 and cd.cd_hash <= 911
;
