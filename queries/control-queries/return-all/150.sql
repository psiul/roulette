select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,date_dim d,customer_demographics cd,household_demographics hd
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 161 and cs.cs_hash <= 911 and d.d_hash >= 501 and d.d_hash <= 901 and cd.cd_hash >= 625 and cd.cd_hash <= 958
;
