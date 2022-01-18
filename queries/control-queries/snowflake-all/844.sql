select count(cs.cs_item_sk)
from catalog_sales cs,customer c,warehouse w,customer_demographics cd,household_demographics hd
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 419 and cs.cs_hash <= 819 and c.c_hash >= 46 and c.c_hash <= 796 and hd.hd_hash >= 341 and hd.hd_hash <= 674
;
