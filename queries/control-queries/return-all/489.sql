select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,household_demographics hd,date_dim d,warehouse w
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 12 and cs.cs_hash <= 412 and cd.cd_hash >= 162 and cd.cd_hash <= 495 and d.d_hash >= 177 and d.d_hash <= 927
;
