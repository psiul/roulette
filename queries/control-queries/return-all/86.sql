select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,warehouse w,household_demographics hd,customer c
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cd.cd_hash >= 295 and cd.cd_hash <= 695 and hd.hd_hash >= 81 and hd.hd_hash <= 831 and c.c_hash >= 384 and c.c_hash <= 717
;
