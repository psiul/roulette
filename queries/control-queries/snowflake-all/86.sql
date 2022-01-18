select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,household_demographics hd,customer_demographics cd,customer c
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 138 and cs.cs_hash <= 888 and hd.hd_hash >= 434 and hd.hd_hash <= 767 and cd.cd_hash >= 381 and cd.cd_hash <= 781
;
