select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,date_dim d,customer_demographics cd,household_demographics hd
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 146 and d.d_hash <= 896 and cd.cd_hash >= 54 and cd.cd_hash <= 454 and hd.hd_hash >= 310 and hd.hd_hash <= 643
;
