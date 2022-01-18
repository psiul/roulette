select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,date_dim d,customer_demographics cd,warehouse w
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and hd.hd_hash >= 117 and hd.hd_hash <= 867 and d.d_hash >= 142 and d.d_hash <= 475 and cd.cd_hash >= 15 and cd.cd_hash <= 415
;
