select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,customer_demographics cd,date_dim d,warehouse w
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 140 and cs.cs_hash <= 540 and cd.cd_hash >= 126 and cd.cd_hash <= 459 and d.d_hash >= 184 and d.d_hash <= 934
;
