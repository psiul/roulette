select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,household_demographics hd,customer c,warehouse w
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cd.cd_hash >= 519 and cd.cd_hash <= 919 and hd.hd_hash >= 231 and hd.hd_hash <= 981 and c.c_hash >= 433 and c.c_hash <= 766
;
