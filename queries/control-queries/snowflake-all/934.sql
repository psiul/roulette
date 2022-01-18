select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,warehouse w,customer c,household_demographics hd
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 112 and cd.cd_hash <= 862 and c.c_hash >= 339 and c.c_hash <= 672 and hd.hd_hash >= 214 and hd.hd_hash <= 614
;
