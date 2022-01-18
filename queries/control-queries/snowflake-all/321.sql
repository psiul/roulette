select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,customer_demographics cd,warehouse w,customer c
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 113 and cs.cs_hash <= 863 and hd.hd_hash >= 197 and hd.hd_hash <= 597 and c.c_hash >= 106 and c.c_hash <= 439
;
