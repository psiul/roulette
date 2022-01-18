select count(cs.cs_item_sk)
from catalog_sales cs,customer c,customer_demographics cd,warehouse w,household_demographics hd
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 85 and cs.cs_hash <= 485 and c.c_hash >= 163 and c.c_hash <= 913 and cd.cd_hash >= 504 and cd.cd_hash <= 837
;
