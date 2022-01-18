select count(cs.cs_item_sk)
from catalog_sales cs,customer c,warehouse w,customer_demographics cd,household_demographics hd
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 142 and cs.cs_hash <= 892 and c.c_hash >= 312 and c.c_hash <= 712 and cd.cd_hash >= 504 and cd.cd_hash <= 837
;
